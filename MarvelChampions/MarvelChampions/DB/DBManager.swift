//
//  DBManager.swift
//  MarvelChampions
//
//  Created by Xavi on 23/12/21.
//

import Foundation
import RealmSwift

class DBManager: Persistence {
    
    // MARK: - Properties
    
    private var storageType: StorageType = .inStorage
    private let keychainIdentifierString: String
    
    private var configuration: Realm.Configuration!
    private var realmMainThread: Realm!
    private var realm: Realm {
        // Distinc mainThreadRealm or create new ones
        if Thread.isMainThread {
            if let realm = realmMainThread {
                return realm
            } else {
                realmMainThread = createRealm()
                return realmMainThread
            }
        } else {
            return createRealm()
        }
    }
    
    // MARK: - Methods
    
    public init(storageType: StorageType = .inStorage) {
        
        self.storageType = storageType
        self.keychainIdentifierString = "xramos.MyMarvelChampions.realm"
    }
    
    public func configureDB() {
        
        switch storageType {
        case .inStorage:
            createConfiguration()
        case .inMemory(let identifier):
            createMemoryConfiguration(identifier: identifier)
        }
    }
    
    public class func removeDatabase() {
        
        guard let urlDocumentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("RealmManager: Document path not found")
        }
        
        do {
            
            // Delete Realm DB in Documents
            let realmInDocuments = urlDocumentsPath.appendingPathComponent("default.realm")
            if FileManager.default.fileExists(atPath: realmInDocuments.path) {
                try FileManager.default.removeItem(at: realmInDocuments)
                print("RealmManager: Realm Database FOUND in \(realmInDocuments.path) - Removed!")
            } else {
                print("RealmManager: Realm Database not found in \(realmInDocuments.path)")
            }
            
            let realmLockInDocuments = urlDocumentsPath.appendingPathComponent("default.realm.lock")
            if FileManager.default.fileExists(atPath: realmLockInDocuments.path) {
                try FileManager.default.removeItem(at: realmLockInDocuments)
                print("RealmManager: Realm Database lock FOUND in \(realmLockInDocuments.path) - Removed!")
            } else {
                print("RealmManager: Realm Database lock not found in \(realmLockInDocuments.path)")
            }
            
            // Delete Realm DB in Realm dir
            let urlRealmDirectory = urlDocumentsPath.appendingPathComponent("Realm")
            
            if FileManager.default.fileExists(atPath: urlRealmDirectory.path) {
                try FileManager.default.removeItem(at: urlRealmDirectory)
                print("RealmManager: Realm Database FOUND in \(urlRealmDirectory.path) - Removed!")
            } else {
                print("RealmManager: Realm Database not found in \(urlRealmDirectory.path)")
            }
        } catch {
            fatalError("RealmManager: Failed to remove the database. Error: \(error)")
        }
    }
    
    // MARK: - Pack Methods
    
    func savePack(pack: Pack) {
        
        let dbPack = DBPack(id: pack.id,
                            name: pack.name,
                            code: pack.code,
                            position: pack.position,
                            available: pack.available,
                            known: pack.known,
                            total: pack.total)
        
        _ = save(dbPack)
    }
    
    func removePack(pack: Pack) {
        
        let dbPack = pack.convertToDBEntity()
        
        writeTransactionAndWait(transactions: { () -> Void in
            
            realm.delete(realm.objects(DBPack.self).filter("id=%@", dbPack.id))
            
        }, completionClosure: { (_) -> Void in})
    }
    
    func getPacks() -> [Pack] {
        
        var packs = [Pack]()
        for result in realm.objects(DBPack.self).sorted(byKeyPath: "available", ascending: true) {
            let pack = result.convertToEntity()
            packs.append(pack)
        }
        
        return packs
    }
}

// MARK: - Private Methods

fileprivate extension DBManager {
    
    func createConfiguration() {
        
        configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        
        configureDatabasePath()
    }
    
    func createMemoryConfiguration(identifier: String) {
        
        configuration = Realm.Configuration(inMemoryIdentifier: identifier,
                                            deleteRealmIfMigrationNeeded: true)
    }
    
    func createRealm() -> Realm {
        
        do {
            return try Realm(configuration: configuration)
        } catch {
            print("RealmManager: Failed to open the database with current configuration: \(error)")
            exit(0)
        }
    }
    
    func configureDatabasePath() {
        
        guard let realmFilename = Realm.Configuration.defaultConfiguration.fileURL?.lastPathComponent else {
            fatalError("RealmManager: Default Configuration not working")
        }
        guard let urlDocumentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("RealmManager: Document path not found")
        }
        let urlRealmDirectory = urlDocumentsPath.appendingPathComponent("Realm")
        let urlRealmDB = urlRealmDirectory.appendingPathComponent(realmFilename)
        
        if FileManager.default.fileExists(atPath: urlRealmDirectory.path) == false {
            guard let _ = try? FileManager.default.createDirectory(at: urlRealmDirectory, withIntermediateDirectories: true, attributes: nil) else {
                fatalError("RealmManager: Can't create directory")
            }
        }
        
        configuration.fileURL = urlRealmDB
        
        print("RealmManager: Realm database path: \(urlRealmDB)")
    }
    
    func writeTransactionAndWait(transactions: (() -> Void), completionClosure: ((Realm.Error?) -> Void)) {
        do {
            try realm.write({ () -> Void in
                transactions()
            })
            completionClosure(nil)
        } catch {
            let error = NSError(domain: "MyMarvelChampions-Realm-Error",
                                code: 1, userInfo: [NSLocalizedDescriptionKey: "Realm Problem"]) as? Realm.Error
            completionClosure(error)
        }
    }
    
    func save<T>(_ entity: T) -> Bool where T: Object {
        
        writeTransactionAndWait(transactions: { () -> Void in
            
            realm.add(entity, update: .all)
            
        }, completionClosure: { (_) -> Void in})
        
        return true
    }
}

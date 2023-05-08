//
//  DBCard.swift
//  MarvelChampions
//
//  Created by Xavi on 28/12/21.
//

import Foundation
import RealmSwift

class DBCard: Object {
    
    @objc public dynamic var id: String = ""
    @objc public dynamic var packCode: String = ""
    @objc public dynamic var packName: String = ""
    @objc public dynamic var typeCode: String = ""
    @objc public dynamic var typeName: String = ""
    @objc public dynamic var factionCode: String = ""
    @objc public dynamic var factionName: String = ""
    @objc public dynamic var cardSetCode: String = ""
    @objc public dynamic var cardSetName: String = ""
    @objc public dynamic var linkedToCode: String = ""
    @objc public dynamic var linkedToName: String = ""
    @objc public dynamic var position: Int = 0
    @objc public dynamic var code: String = ""
    @objc public dynamic var name: String = ""
    @objc public dynamic var realName: String = ""
    public private(set) var cost = RealmOptional<Int>(nil)
    @objc public dynamic var text: String = ""
    @objc public dynamic var realText: String = ""
    @objc public dynamic var quantity: Int = 0
    public private(set) var handSize = RealmOptional<Int>(nil)
    public private(set) var health = RealmOptional<Int>(nil)
    public private(set) var resourceEnergy = RealmOptional<Int>(nil)
    public private(set) var resourcePhysical = RealmOptional<Int>(nil)
    public private(set) var resourceMental = RealmOptional<Int>(nil)
    public private(set) var resourceWild = RealmOptional<Int>(nil)
    @objc public dynamic var healthPerHero: Bool = false
    public private(set) var thwart = RealmOptional<Int>(nil)
    public private(set) var attack = RealmOptional<Int>(nil)
    public private(set) var defense = RealmOptional<Int>(nil)
    public private(set) var deckLimit = RealmOptional<Int>(nil)
    @objc public dynamic var traits: String = ""
    @objc public dynamic var realTraits: String = ""
    @objc public dynamic var flavor: String = ""
    @objc public dynamic var isUnique: Bool = false
    @objc public dynamic var hidden: Bool = false
    @objc public dynamic var permanent: Bool = false
    @objc public dynamic var doubleSided: Bool = false
    @objc public dynamic var imagesrc: String = ""
    
    // MARK: - Methods
    
    public required override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        
        return "id"
    }
    
    init(id: String, packCode: String, packName: String, typeCode: String, typeName: String, factionCode: String, factionName: String, cardSetCode: String?, cardSetName: String?, linkedToCode: String?, linkedToName: String?, position: Int, code: String, name: String?, realName: String?, cost: Int?, text: String?, realText: String?, quantity: Int, handSize: Int?, health: Int?, resourceEnergy: Int?, resourcePhysical: Int?, resourceMental: Int?, resourceWild: Int?, healthPerHero: Bool, thwart: Int?, attack: Int?, defense: Int?, deckLimit: Int?, traits: String?, realTraits: String?, flavor: String?, isUnique: Bool, hidden: Bool, permanent: Bool, doubleSided: Bool, imagesrc: String?) {
        
        self.id = id
        self.packCode = packCode
        self.packName = packName
        self.typeCode = typeCode
        self.typeName = typeName
        self.factionCode = factionCode
        self.factionName = factionName
        self.cardSetCode = cardSetCode ?? ""
        self.cardSetName = cardSetName ?? ""
        self.linkedToCode = linkedToCode ?? ""
        self.linkedToName = linkedToName ?? ""
        self.position = position
        self.code = code
        self.name = name ?? ""
        self.realName = realName ?? ""
        self.cost.value = cost
        self.text = text ?? ""
        self.realText = realText ?? ""
        self.quantity = quantity
        self.handSize.value = handSize
        self.health.value = health
        self.resourceEnergy.value = resourceEnergy
        self.resourcePhysical.value = resourcePhysical
        self.resourceMental.value = resourceMental
        self.resourceWild.value = resourceWild
        self.healthPerHero = healthPerHero
        self.thwart.value = thwart
        self.attack.value = attack
        self.defense.value = defense
        self.deckLimit.value = deckLimit
        self.traits = traits ?? ""
        self.realTraits = realTraits ?? ""
        self.flavor = flavor ?? ""
        self.isUnique = isUnique
        self.hidden = hidden
        self.permanent = permanent
        self.doubleSided = doubleSided
        self.imagesrc = imagesrc ?? ""
    }
    
    func convertToEntity() -> Card {
        
        return Card(id: id,
                    packCode: packCode,
                    packName: packName,
                    typeCode: typeCode,
                    typeName: typeName,
                    factionCode: factionCode,
                    factionName: factionName,
                    cardSetCode: cardSetCode,
                    cardSetName: cardSetName,
                    linkedToCode: linkedToCode,
                    linkedToName: linkedToName,
                    position: position,
                    code: code,
                    name: name,
                    realName: realName,
                    cost: cost.value,
                    text: text,
                    realText: realText,
                    quantity: quantity,
                    handSize: handSize.value,
                    health: health.value,
                    resourceEnergy: resourceEnergy.value,
                    resourcePhysical: resourcePhysical.value,
                    resourceMental: resourceMental.value,
                    resourceWild: resourceWild.value,
                    healthPerHero: healthPerHero,
                    thwart: thwart.value,
                    attack: attack.value,
                    defense: defense.value,
                    deckLimit: deckLimit.value,
                    traits: traits,
                    realTraits: realTraits,
                    flavor: flavor,
                    isUnique: isUnique,
                    hidden: hidden,
                    permanent: permanent,
                    doubleSided: doubleSided,
                    imagesrc: imagesrc)
    }
}

//
//  Card.swift
//  MarvelChampions
//
//  Created by Xavi on 28/12/21.
//

import Foundation

struct Card: Identifiable {
    
    let id: String
    let packCode: String
    let packName: String
    let typeCode: String
    let typeName: String
    let factionCode: String
    let factionName: String
    let cardSetCode: String?
    let cardSetName: String?
    let linkedToCode: String?
    let linkedToName: String?
    let position: Int
    let code: String
    let name: String?
    let realName: String?
    let cost: Int?
    let text: String?
    let realText: String?
    let quantity: Int
    let handSize: Int?
    let health: Int?
    let resourceEnergy: Int?
    let resourcePhysical: Int?
    let resourceMental: Int?
    let resourceWild: Int?
    let healthPerHero: Bool
    let thwart: Int?
    let attack: Int?
    let defense: Int?
    let deckLimit: Int?
    let traits: String?
    let realTraits: String?
    let flavor: String?
    let isUnique: Bool
    let hidden: Bool
    let permanent: Bool
    let doubleSided: Bool
    let imagesrc: String?
    
    func convertToDBEntity() -> DBCard {
        
        return DBCard(id: id,
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
                      cost: cost,
                      text: text,
                      realText: realText,
                      quantity: quantity,
                      handSize: handSize,
                      health: health,
                      resourceEnergy: resourceEnergy,
                      resourcePhysical: resourcePhysical,
                      resourceMental: resourceMental,
                      resourceWild: resourceWild,
                      healthPerHero: healthPerHero,
                      thwart: thwart,
                      attack: attack,
                      defense: defense,
                      deckLimit: deckLimit,
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

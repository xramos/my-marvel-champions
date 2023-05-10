//
//  CardType.swift
//  MarvelChampions
//
//  Created by Xavi on 24/12/21.
//

import Foundation

enum CardType: String {
    
    static var allCases: [CardType] {
        return [.Hero, .AlterEgo, .Ally, .Event, .Support, .Resource, .Upgrade, .Treachery, .Obligation, .Minion, .SideScheme]
    }
    
    case Hero = "hero", AlterEgo = "alter_ego", Ally = "ally", Event = "event", Support = "support", Resource = "resource", Upgrade = "upgrade", Treachery = "treachery", Obligation = "obligation", Minion = "minion", SideScheme = "side_scheme"
}

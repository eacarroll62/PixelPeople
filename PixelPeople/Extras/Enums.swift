//
//  Enums.swift
//  PixelPeople
//
//  Created by Eric Carroll on 5/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

enum Seasons: String, Equatable, CaseIterable {
    case harvest = "Harvest"
    case thaw = "Thaw"
    case swell = "Swell"
    case frost = "Frost"
    case any = "Any"
    case altar = "Altar"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum Category: String, Equatable, CaseIterable {
    case aquatic = "Aquatic"
    case arboreal = "Arboreal"
    case bear = "Bear"
    case bigCat = "Big Cat"
    case bird = "Bird"
    case carnivore = "Carnivore"
    case cat = "Cat"
    case dog = "Dog"
    case extinct = "Extinct"
    case farm = "Farm"
    case fast = "Fast"
    case herbivore = "Herbivore"
    case insect = "Insect"
    case mammal = "Mammal"
    case mollusc = "Mollusc"
    case mythical = "Mythical"
    case ominvore = "Omnivore"
    case pet = "Pet"
    case primate = "Primate"
    case reptile = "Reptile"
    case scavenger = "Scavenger"
    case secret = "Secret"
    case small = "Small"
    case snow = "Snow"
    case special = "Special"
    case strong = "Strong"
    case tasty = "Tasty"
    case wild = "Wild"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum Genomes: String, Equatable, CaseIterable {
    case academic = "Academic"
    case administration = "Administration"
    case business = "Business"
    case creative = "Creative"
    case curious = "Curious"
    case enchanted = "Enchanted"
    case evil = "Evil"
    case explorers = "Explorers"
    case hospitality = "Hospitality"
    case law = "law"
    case media = "Media"
    case medical = "Medical"
    case music = "Music"
    case performers = "Performers"
    case production = "Production"
    case resident = "Resident"
    case services = "Services"
    case special = "Special"
    case sports = "Sports"
    case technical = "Technical"
    case transport = "Transport"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum BuildingTypes: String, Equatable, CaseIterable {
    case administration = "Administration"
    case business = "Business"
    case creative = "Creative"
    case entertainment = "Entertainment"
    case fb = "F & B"
    case science = "Science"
    case services = "Services"
    case none = "None"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

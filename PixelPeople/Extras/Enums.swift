//
//  Enums.swift
//  PixelPeople
//
//  Created by Eric Carroll on 5/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

enum SeasonFilter: String, Equatable, CaseIterable {
    case harvest = "Harvest"
    case thaw = "Thaw"
    case swell = "Swell"
    case frost = "Frost"
    case any = "Any"
    case altar = "Altar"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum CategoryFilter: String, Equatable, CaseIterable {
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

enum GenomeFilter: String, Equatable, CaseIterable {
    case academic = "Academic"
    case administration = "Administration"
    case business = "Business"
    case creative = "Creative"
    case curious = "Curious"
    case enchanted = "Enchanted"
    case evil = "Evil"
    case explorers = "Explorers"
    case hospitality = "Hospitality"
    case law = "Law"
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

enum BuildingFilter: String, Equatable, CaseIterable {
    case administration = "Administration"
    case business = "Business"
    case creative = "Creative"
    case entertainment = "Entertainment"
    case fb = "F&B"
    case science = "Science"
    case services = "Services"
    case none = "None"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum AnimalFilter: String, Equatable, CaseIterable {
            case parrot = "Parrot"
            case mouse = "Mouse"
            case bull = "Bull"
            case spider = "Spider"
            case squirrel = "Squirrel"
            case mccaw = "McCaw"
            case snake = "Snake"
            case trout = "Trout"
        
            var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum ProfessionFilter: String, Equatable, CaseIterable {
            case foodie = "Foodie"
            case mayor = "Mayor"
            case engineer = "Engineer"
            case sheriff = "Sheriff"
            case mechanic = "Mechanic"
            case architect = "Architect"
        
            var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum TierFilter: String, Equatable, CaseIterable {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
    
        var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
enum Filter: String, Equatable, CaseIterable {
// Seasons
        case harvest = "Harvest"
        case thaw = "Thaw"
        case swell = "Swell"
        case frost = "Frost"
        case any = "Any"
        case altar = "Altar"

// Categories
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
        case special = "Special"  // Also Genome
        case strong = "Strong"
        case tasty = "Tasty"
        case wild = "Wild"

// Genomes
        case academic = "Academic"
        case administration = "Administration"  // Also Building Type
        case business = "Business"              // Also Building Type
        case creative = "Creative"              // Also Building Type
        case curious = "Curious"
        case enchanted = "Enchanted"
        case evil = "Evil"
        case explorers = "Explorers"
        case hospitality = "Hospitality"
        case law = "Law"
        case media = "Media"
        case medical = "Medical"
        case music = "Music"
        case performers = "Performers"
        case production = "Production"
        case resident = "Resident"
        case services = "Services"              // Also Building Type
        case sports = "Sports"
        case technical = "Technical"
        case transport = "Transport"

// BuildingTypes
        case entertainment = "Entertainment"
        case fb = "F&B"
        case science = "Science"
        case none = "None"
        
// Animals
        case parrot = "Parrot"
        case mouse = "Mouse"
        case bull = "Bull"
        case spider = "Spider"
        case squirrel = "Squirrel"
        case mccaw = "McCaw"
        case snake = "Snake"
        case trout = "Trout"
// Professions
        case foodie = "Foodie"
        case mayor = "Mayor"
        case engineer = "Engineer"
        case sheriff = "Sheriff"
        case mechanic = "Mechanic"
        case architect = "Architect"
    
// Tiers
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
    
        var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

enum Property: String, Equatable, CaseIterable {
    case season = "Season"
    case category = "Category"
    case tier = "Tier"
    case parent = "Parent"
    case genome = "Genome"
    case clone = "Clone"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

public protocol EnumConvertible: Hashable {
    init?(hashValue hash: Int)
    static func countMembers() -> Int
    static func members() -> [Self]
}

extension EnumConvertible where Self:Hashable {
    internal static func fromHash(hashValue index: Int) -> Self {
        let member = unsafeBitCast(UInt8(index), to: Self.self)
        return member
    }
    
    static public func countMembers() -> Int {
        // Cannot add storage to protocol at this time, so this gets computed each call
        let byteCount = MemoryLayout.size(ofValue: self)
        if byteCount == 0 {return 8}
        print("byteCount = \(MemoryLayout.size(ofValue: Int.self))")
        if byteCount > 16 {fatalError("Unable to process enumeration, byteCount = \(byteCount)")}
        let singleByte = byteCount == 8
        let minValue = singleByte ? 2 : 2049
        let maxValue = singleByte ? 2 << 8: 2 << 16
        for hashIndex in minValue..<maxValue {
            switch singleByte {
            case true:
                if unsafeBitCast(UInt8(hashIndex), to: self).hashValue == 0 {
                    return hashIndex
                }
            case false:
                if unsafeBitCast(UInt16(hashIndex), to: self).hashValue == 0 {
                    return hashIndex
                }
            }
        }
        return maxValue
    }
    
    static public func members() -> [Self] {
        var enumerationMembers = [Self]()
  //      let singleByte = MemoryLayout.size(ofValue: self) == 1
        for index in 0..<4294967296 {
   //     for index in 0..<Self.countMembers() {
  //          switch singleByte {
  //          case true:
                let member = unsafeBitCast(UInt64(index), to: self)
                enumerationMembers.append(member)
  //          case false:
   //             let member = unsafeBitCast(UInt16(index), to: self)
   //             enumerationMembers.append(member)
   //         }
        }
        return enumerationMembers
    }

    public init?(hashValue hash: Int) {
        if hash >= 4294967296 {return nil}
   //     if hash >= Self.countMembers() {return nil}
        self = Self.fromHash(hashValue: hash)
    }
}


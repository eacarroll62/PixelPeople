//
//  Building.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/29/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation
 
class Buildings: ObservableObject {
    @Published var buildings: [Building]
    static let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Building].self, from: data) {
                self.buildings = decoded
                return
            }
        }
            
        self.buildings = Bundle.main.decode([Building].self, from: "buildings.json")
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(buildings) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
}

class Building: Codable, Identifiable {
    let id: Int
    let name: String
    var level: Int
    let landCost: Int
    let adjustedWorkTime: Int
    let coinsPerUse: String
    let coinsPerLand: String
    let cps: Int
    let workTime: Int
    let multiplier: Int
    let category: String
    let jobs: [Profession]
    let image: String
    var isBuilt: Bool
}


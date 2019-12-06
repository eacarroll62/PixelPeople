//
//  Building.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/29/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

struct Building: Codable, Identifiable {
    let id = UUID()
    let name: String
    let level: Int
    let landCost: Int
    let adjustedWorkTime: Int
    let coinsPerUse: String
    let coinsPerLand: String
    let cps: Int
    let workTime: Int
    let multiplier: Int
    let jobs: [Profession]
    let image: String
    var isBuilt: Bool = false
}

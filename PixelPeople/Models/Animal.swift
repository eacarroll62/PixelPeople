//
//  Animal.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/30/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

class Animals: ObservableObject {
    @Published var animal: [Animal]
    
    init() {
        self.animal = Bundle.main.decode([Animal].self, from: "animals.json")
    }
}

class Animal: Codable, Identifiable {
    let id: Int
    let name: String
    let scientific: String
    let season: String
    let category: [String]
    let tier: Int
    let parents: [String]
    let image: String
}





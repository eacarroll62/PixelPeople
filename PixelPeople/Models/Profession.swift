//
//  Job.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/29/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

class Professions: ObservableObject {
    @Published var profession: [Profession]
 
    init() {
        self.profession = Bundle.main.decode([Profession].self, from: "professions.json")
    }
}

class Profession: Codable, Identifiable {
    let id: Int
    let name: String
    let motto: String
    let genome: String
    let clones: [Clone]
    let image: String?
}

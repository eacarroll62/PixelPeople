//
//  Job.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/29/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

struct Profession: Codable, Identifiable {
    let id = UUID()
    let name: String
    let clones: [Clone]?
    let image: String?
}

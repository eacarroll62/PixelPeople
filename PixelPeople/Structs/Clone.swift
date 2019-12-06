//
//  Clone.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/30/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import Foundation

struct Clone: Codable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

//
//  BuildingListView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 3/15/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingCloneRow: View {
    var building: Building
    var profession: Profession
    
    let colors: [String : [Color]] = ["Administration": [Color.olive, Color.oliveYellow],
                                      "Business": [Color.yellowGreen, Color.greenYellow],
                                      "Creative": [Color.yellowGreen, Color.greenYellow],
                                      "Entertainment": [Color.fluorescentOrange, Color.darkOrange],
                                      "F&B": [Color.yellowGreen, Color.greenYellow],
                                      "Science": [Color.yellowGreen, Color.greenYellow],
                                      "Services": [Color.yellowGreen, Color.greenYellow],
                                      "None": [Color.yellowGreen, Color.greenYellow],
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(colors[building.category]![0])
                .frame(width: 280, height: 75)
            RoundedRectangle(cornerRadius: 10)
                .fill(colors[building.category]![1])
                .frame(width: 270, height: 60)
            HStack {
                Image(profession.image)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .offset(x: -40, y: 0)
                Text(profession.name)
                    .font(.title)
                    .offset(x: 40, y: 0)
            }
        }
    }
}

struct BuildingCloneRow_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static let building = buildings[100]
    
    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static let profession = professions[100]
    
    static var previews: some View {
        BuildingCloneRow(building: building, profession: profession)
    }
}


//
//  BuildingThumb.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/30/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingThumb: View {
    @Binding var showDetail: Bool
    var building: Building
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
            index = self.building.name
        }) {
            VStack {
                Image(building.image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                Text(building.name)
                    .scaledFont(name: "Georgia", size: 8)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct BuildingThumb_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static var previews: some View {
        BuildingThumb(showDetail: .constant(true), building: buildings[0])
    }
}

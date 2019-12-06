//
//  ContentView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/27/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    
    var body: some View {
        NavigationView {
            List(buildings, id: \.id) { building in
                NavigationLink(destination: BuildingView(building: building)) {
                    Text(building.name)
                }
            }
            .navigationBarTitle("Pixel People Companion", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

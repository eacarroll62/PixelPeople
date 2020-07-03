//
//  BuildingView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingView: View {
    @State private var showDetailView = false
    @State private var showBuildingFilters = false
    
    let buildings = Buildings()
    let dg = DragGesture()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    GridView(rows: buildings.buildings.count/4, columns: 4, content: card)
                    Spacer()
                }
                .navigationBarTitle("Pixel People Professions Buildings", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {self.showBuildingFilters = true}) {
                        Text("Filters")
                    }
                    .sheet(isPresented: $showBuildingFilters) {
                        BuildingFilters(buildings: self.buildings, isPresented: self.$showBuildingFilters)
                            .highPriorityGesture(self.dg)
                    }
                )
                .sheet(isPresented: $showDetailView) {
                    BuildingDetailsView(isPresented: self.$showDetailView, building: self.buildings.buildings[self.buildings.buildings.firstIndex(where: {$0.name == index}) ?? 0])
                    .highPriorityGesture(self.dg)
                }
            }
        }
    }
    
    func card(atRow row: Int, column: Int) -> some View {
        let index = (row * 4) + column
        let building = buildings.buildings[index]
        
        return BuildingThumb(showDetail: $showDetailView, building: building)
            .accessibility(addTraits: .isButton)
            .accessibility(label: Text("Open \(building.name) Detail"))
    }
}

struct BuildingView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingView()
    }
}


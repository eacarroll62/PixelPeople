//
//  DetailView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/28/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingCategoryFilter: View {
    @ObservedObject var buildings: Buildings
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let dg = DragGesture()
    let filter: BuildingFilter
    
    var filteredBuildings: [Building] {
        var filterBuildings: [Building]
        
        filterBuildings = buildings.buildings.filter { $0.category.contains(filter.rawValue) }
        
        let mod = filterBuildings.count % 4
      
        switch mod {
        case 1:
            for _ in 1...3 {
                filterBuildings.append(buildings.buildings[buildings.buildings.endIndex - 1])
            }
        case 2:
            for _ in 1...2 {
                filterBuildings.append(buildings.buildings[buildings.buildings.endIndex - 1])
            }
        case 3:
            filterBuildings.append(buildings.buildings[buildings.buildings.endIndex - 1])
        default:
            break
        }
      
        return filterBuildings
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    GridView(rows: filteredBuildings.count/4, columns: 4, content: card)
                    Spacer()
                }
                .padding()
                .sheet(isPresented: $showDetailView) {
                    BuildingDetailsView(isPresented: self.$showDetailView, building: self.filteredBuildings[self.filteredBuildings.firstIndex(where: {$0.name == index}) ?? 0])
                    .highPriorityGesture(self.dg)
                }
                .navigationBarTitle("\(filter.rawValue)", displayMode: .inline)
                .navigationBarItems(trailing: ExitButton(isPresented: self.$isPresented))
            }
        }
    }
    
    func card(atRow row: Int, column: Int) -> some View {
        let index = (row * 4) + column
        let building = filteredBuildings[index]
        
        return BuildingThumb(showDetail: $showDetailView, building: building)
            .accessibility(addTraits: .isButton)
            .accessibility(label: Text("Open \(building.name) Detail"))
    }
}

struct BuildingCategoryFilter_Previews: PreviewProvider {
    static var previews: some View {
        BuildingCategoryFilter(buildings: Buildings(), isPresented: .constant(true), filter: .business)
    }
}

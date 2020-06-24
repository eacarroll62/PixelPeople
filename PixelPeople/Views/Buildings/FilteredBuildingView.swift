//
//  CategoryView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct FilteredBuildingView: View {
    @EnvironmentObject var buildings: Buildings
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let category: BuildingTypes
    let dg = DragGesture()
    
    var filteredBuildings: [Building] {
        return buildings.buildings.filter { $0.category == category.rawValue}
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                     GridView(rows: filteredBuildings.count/4, columns: 4, content: card)
                     Spacer()
                }
                .padding()
                .popover(isPresented: $showDetailView) {
                    BuildingDetailsView(isPresented: self.$showDetailView, building: self.filteredBuildings[1])
                    .highPriorityGesture(self.dg)
                }
            }
            .navigationBarTitle(Text("\(category.rawValue)"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPresented = false
                }) {
                    Image(systemName: "clear.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .background(Color.white)
                    .foregroundColor(Color.red)
                }
            )
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

struct BuildingThumb: View {
    @Binding var showDetail: Bool
    var building: Building
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
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

struct FilteredBuildingView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredBuildingView(isPresented: .constant(true), category: .business)
    }
}

//
//  FilterEntity.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/29/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BlankCard: View {
    var animal: Animal
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 10)
                    .fill(animalColors[animal.tier]![1])
                    .frame(width: 320, height: 520)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: 304, height: 504)
                RoundedRectangle(cornerRadius: 10)
                    .fill(animalColors[animal.tier]![0])
                    .frame(width: 300, height: 500)
                RoundedRectangle(cornerRadius: 10)
                    .fill(animalColors[animal.tier]![1])
                    .frame(width: 244, height: 354)
                RoundedRectangle(cornerRadius: 10)
                    .fill(RadialGradient(gradient: Gradient(colors: [.whiteSmoke, .black]), center: .center, startRadius: 5, endRadius: 180))
                    .frame(width: 240, height: 350)
            }
        }
    }
    /*
    @ObservedObject var buildings: Buildings
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let dg = DragGesture()
    let filter: BuildingFilter
    let property: Property
    
    var filteredBuildings: [Building] {
        var filterBuildings: [Building]
        
        switch property {
        case .season:
            filterBuildings = buildings.buildings.filter { $0.category.contains(filter.rawValue) }
        case .category:
            filterBuildings = buildings.buildings.filter { $0.category.contains(filter.rawValue) }
        case .tier:
            filterBuildings = buildings.buildings.filter { $0.category.contains(filter.rawValue) }
        case .parent:
            filterBuildings = buildings.buildings.filter { $0.category.contains(filter.rawValue) }
        case .genome:
            filterBuildings = buildings.buildings.filter { $0.category.contains(filter.rawValue) }
        case .clone:
            filterBuildings = buildings.buildings.filter { $0.category.contains(filter.rawValue) }
        }
        
        let mod = buildings.buildings.count % 4
      
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
            for _ in 1...4 {
                filterBuildings.append(buildings.buildings[buildings.buildings.endIndex - 1])
            }
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
 */
}

struct BlankCard_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode([Animal].self, from: "animals.json")
    static var previews: some View {
        BlankCard(animal: animals[223])
    }
}
/*
struct FilterBuildings_Previews: PreviewProvider {
    static var previews: some View {
        FilterBuildings(buildings: Buildings(), isPresented: .constant(true), filter: .business, property: .category)
    }
}
*/

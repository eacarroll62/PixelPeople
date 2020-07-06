//
//  AnimalView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 12/27/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct AnimalView: View {
    @State private var showDetailView = false
    @State private var showAnimalFilters = false
    @State private var showTierFilter = false
    @State private var seasonFilter: SeasonFilter = .altar
    
    let animals = Animals()
    let dg = DragGesture()
    
    var filteredAnimals: [Animal] {
        var filterAnimals: [Animal]

        filterAnimals = animals.animals.filter { $0.name != "Empty"}
        
        let mod = filterAnimals.count % 4
      
        switch mod {
        case 1:
            for _ in 1...3 {
                filterAnimals.append(animals.animals[animals.animals.endIndex - 1])
            }
        case 2:
            for _ in 1...2 {
                filterAnimals.append(animals.animals[animals.animals.endIndex - 1])
            }
        case 3:
            filterAnimals.append(animals.animals[animals.animals.endIndex - 1])
        default:
            break
        }
      
        return filterAnimals
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    GridView(rows: filteredAnimals.count/4, columns: 4, content: card)
                    Spacer()
                }
                .navigationBarTitle("Pixel People Animals", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {self.showAnimalFilters = true}) {
                        Text("Filters")
                    }
                    .sheet(isPresented: $showAnimalFilters) {
                        AnimalFilters(animals: self.animals, isPresented: self.$showAnimalFilters)
                            .highPriorityGesture(self.dg)
                    }
                )
                .sheet(isPresented: $showDetailView) {
                    AnimalDetailsView(isPresented: self.$showDetailView, animal: self.filteredAnimals[self.filteredAnimals.firstIndex(where: {$0.name == index}) ?? 0])
                    .highPriorityGesture(self.dg)
                }
            }
        }
    }
    
    func card(atRow row: Int, column: Int) -> some View {
        let index = (row * 4) + column
        let animal = animals.animals[index]
        
        return AnimalThumb(showDetail: $showDetailView, animal: animal)
            .accessibility(addTraits: .isButton)
            .accessibility(label: Text("Open \(animal.name) Detail"))
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}

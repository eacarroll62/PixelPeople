//
//  DetailView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/28/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct AnimalParentFilter: View {
    @ObservedObject var animals: Animals
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let dg = DragGesture()
    let filter: AnimalFilter
    
    var filteredAnimals: [Animal] {
        var filterAnimals: [Animal]
        
        filterAnimals = animals.animals.filter { $0.parents.contains(filter.rawValue) }
        
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
            for _ in 1...4 {
                filterAnimals.append(animals.animals[animals.animals.endIndex - 1])
            }
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
                .padding()
                .sheet(isPresented: $showDetailView) {
                    AnimalDetailsView(isPresented: self.$showDetailView, animal: self.filteredAnimals[self.filteredAnimals.firstIndex(where: {$0.name == index}) ?? 0])
                    .highPriorityGesture(self.dg)
                }
                .navigationBarTitle("\(filter.rawValue)", displayMode: .inline)
                .navigationBarItems(trailing: ExitButton(isPresented: self.$isPresented))
            }
        }
    }
    
    func card(atRow row: Int, column: Int) -> some View {
        let index = (row * 4) + column
        let animal = filteredAnimals[index]
        
        return AnimalThumb(showDetail: $showDetailView, animal: animal)
            .accessibility(addTraits: .isButton)
            .accessibility(label: Text("Open \(animal.name) Detail"))
    }
}

struct AnimalParentFilter_Previews: PreviewProvider {
    static var previews: some View {
        AnimalParentFilter(animals: Animals(), isPresented: .constant(true), filter: .snake)
    }
}

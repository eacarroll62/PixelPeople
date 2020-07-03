//
//  FilteredMammalView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/27/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct FilteredCategoryView: View {
    @ObservedObject var animals: Animals
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let category: Filter
    let dg = DragGesture()
    
    var filteredAnimals: [Animal] {
//        var filterAnimals = animals.animals.filter { $0.category. == category.rawValue}
        var filterAnimals = animals.animals.filter { $0.category.contains(category.rawValue) }
        
        let mod = animals.animals.count % 4
        
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
            print("\(filterAnimals.count)")
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
                .navigationBarTitle("\(category.rawValue)", displayMode: .inline)
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
    }
    
    func card(atRow row: Int, column: Int) -> some View {
        let index = (row * 4) + column
        let animal = filteredAnimals[index]
        
        return AnimalThumb(showDetail: $showDetailView, animal: animal)
            .accessibility(addTraits: .isButton)
            .accessibility(label: Text("Open \(animal.name) Detail"))
    }
}

struct FilteredCategoryView_Previews: PreviewProvider {
    @Binding var showView: Bool
    
    static var previews: some View {
        FilteredCategoryView(animals: Animals(), isPresented: .constant(true), category: .small)
    }
}

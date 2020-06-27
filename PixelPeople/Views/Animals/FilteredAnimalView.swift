//
//  SeasonView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/15/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct FilteredAnimalView: View {
    @ObservedObject var animals: Animals
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let season: Seasons
    let dg = DragGesture()
    
    var filteredAnimals: [Animal] {
        var filterAnimals = animals.animals.filter { $0.season == season.rawValue}
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
                    AnimalDetailsView(isPresented: self.$showDetailView, animal: self.filteredAnimals[0])
                    .highPriorityGesture(self.dg)
                }
                .navigationBarTitle("\(season.rawValue)", displayMode: .inline)
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

struct AnimalThumb: View {
    @Binding var showDetail: Bool
    
    var animal: Animal
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
        }) {
            VStack {
                Image(animal.image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .background(Color.black)
                Text(animal.name)
                    .scaledFont(name: "Georgia", size: 8)
                    .foregroundColor(Color.white)
            }
        }
    }
}


struct FilteredAnimalView_Previews: PreviewProvider {
    @Binding var showView: Bool
    
    static var previews: some View {
        FilteredAnimalView(animals: Animals(), isPresented: .constant(true), season: .frost)
    }
}


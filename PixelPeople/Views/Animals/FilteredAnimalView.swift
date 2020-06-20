//
//  SeasonView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/15/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct FilteredAnimalView: View {
    @EnvironmentObject var animals: Animals
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let season: Seasons
    let dg = DragGesture()
    
    var filteredAnimals: [Animal] {
        return animals.animal.filter { $0.season == season.rawValue}
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    GridView(rows: filteredAnimals.count/4, columns: 4, content: card)
                    Spacer()
                }
           //     .background(Color.gray)
                .padding()
           //     .sheet(isPresented: $showDetailView) {
           //         AnimalDetailsView(isPresented: self.$showDetailView, animal: self.filteredAnimals[1])
           //             .highPriorityGesture(self.dg)
           //     }
                .popover(isPresented: $showDetailView) {
                    AnimalDetailsView(isPresented: self.$showDetailView, animal: self.filteredAnimals[1])
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
        FilteredAnimalView(isPresented: .constant(true), season: .frost)
    }
}


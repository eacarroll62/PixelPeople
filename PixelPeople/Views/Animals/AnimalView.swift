//
//  AnimalView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 12/27/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct AnimalView: View {
    @State var showFilteredView = false
    @State private var selectedSeason: Seasons = .frost
    @State private var selectedCategory: Category = .mammal
    
    var animals = Animals()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Season")) {
                    Picker(selection: self.$selectedSeason, label: Text("Select Season")) {
                        ForEach(Seasons.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
  //              Section(header: Text("Select Category")) {
  //                  Picker(selection: self.$selectedCategory, label: Text("")) {
  //                      ForEach(Category.allCases, id: \.self) {value in
  //                          Text(value.localizedName).tag(value)
  //                      }
  //                  }.pickerStyle(WheelPickerStyle())
  //                     .frame(width: 100, height: 100)
  //              }
            }
            .navigationBarTitle("Animals")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showFilteredView.toggle()
                }) {
                    Image(systemName: "bell.circle.fill")
                        .font(Font.system(.title))
                }
                    .padding()
                    .sheet(isPresented: $showFilteredView) {
                        FilteredAnimalView(animals: self.animals, isPresented: self.$showFilteredView, season: self.selectedSeason).environmentObject(self.animals)
                    }
            )
        }
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}

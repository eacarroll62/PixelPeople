//
//  AnimalFilters.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/30/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct AnimalFilters: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var animals: Animals
    @Binding var isPresented: Bool
    @State private var showSeasonFilter = false
    @State private var showTierFilter = false
    @State private var showCategoryFilter = false
    @State private var showParentFilter = false
    @State private var selectedSeason = SeasonFilter.altar
    @State private var selectedTier = TierFilter.one
    @State private var selectedCategory = CategoryFilter.aquatic
    @State private var selectedParent = AnimalFilter.mouse
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: HeaderText(header: "Seasons")) {
                    Picker(selection: self.$selectedSeason, label: Text("Select Season")) {
                        ForEach(SeasonFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.labelsHidden()
                    
                    Button(action: {self.showSeasonFilter.toggle()}) {
                        Text("Filter by Season")
                            .foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showSeasonFilter) {
                        AnimalSeasonFilter(animals: self.animals, isPresented: self.$isPresented, filter: self.selectedSeason)}
                }
                
                Section(header: HeaderText(header: "Tiers")) {
                    Picker(selection: self.$selectedTier, label: Text("Select Tier")) {
                        ForEach(TierFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.pickerStyle(SegmentedPickerStyle()).labelsHidden()
                    
                    Button(action: {self.showTierFilter.toggle()}) {
                        Text("Filter by Tier")
                            .foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showTierFilter) {
                        AnimalTierFilter(animals: self.animals, isPresented: self.$isPresented, filter: self.selectedTier)
                    }
                }
                
                Section(header: HeaderText(header: "Categories")) {
                    Picker(selection: self.$selectedCategory, label: Text("Select Category")) {
                        ForEach(CategoryFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                        }.labelsHidden()
                    
                    Button(action: {self.showCategoryFilter.toggle()}) {
                        Text("Filter by Category").foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showCategoryFilter) {
                        AnimalCategoryFilter(animals: self.animals, isPresented: self.$isPresented, filter: self.selectedCategory)
                    }
                }
                
                Section(header: HeaderText(header: "Parent")) {
                    Picker(selection: self.$selectedParent, label: Text("Select Parent")) {
                        ForEach(AnimalFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.labelsHidden()
                    
                    Button(action: {self.showParentFilter.toggle()}) {
                        Text("Filter by Parent").foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showParentFilter) {
                        AnimalParentFilter(animals: self.animals, isPresented: self.$isPresented, filter: self.selectedParent)
                    }
                }
            }
            .navigationBarTitle("Animal Filters", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Back")
                    }
                }
            )
        }
    }
}

struct AnimalFilters_Previews: PreviewProvider {
    static var previews: some View {
        AnimalFilters(animals: Animals(), isPresented: .constant(true))
    }
}

//
//  AnimalFilters.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/30/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingFilters: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var buildings: Buildings
    @Binding var isPresented: Bool

    @State private var showBuildingTypeFilter = false
    @State private var showProfessionFilter = false
    
    @State private var selectedBuildingType = BuildingFilter.administration
    @State private var selectedProfession = ProfessionFilter.mayor
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: HeaderText(header: "Categories")) {
                    Picker(selection: self.$selectedBuildingType, label: Text("Select Category")) {
                        ForEach(BuildingFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.labelsHidden()
                    
                    Button(action: {self.showBuildingTypeFilter.toggle()}) {
                        Text("Filter by Category")
                            .foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showBuildingTypeFilter) {
                        BuildingCategoryFilter(buildings: self.buildings, isPresented: self.$isPresented, filter: self.selectedBuildingType)}
                }
                
                Section(header: HeaderText(header: "Clones")) {
                    Picker(selection: self.$selectedProfession, label: Text("Select Clone")) {
                        ForEach(ProfessionFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.labelsHidden()
                    
                    Button(action: {self.showProfessionFilter.toggle()}) {
                        Text("Filter by Clone")
                            .foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showProfessionFilter) {
                        BuildingCloneFilter(buildings: self.buildings, isPresented: self.$isPresented, filter: self.selectedProfession)}
                    }
            }
            .navigationBarTitle("Building Filters", displayMode: .inline)
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

struct BuildingFilters_Previews: PreviewProvider {
    static var previews: some View {
        BuildingFilters(buildings: Buildings(), isPresented: .constant(true))
    }
}

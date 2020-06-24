//
//  BuildingView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingView: View {
    @State var showFilteredView = false
    @State private var selectedType: BuildingTypes = .administration
    
    var buildings = Buildings()
    
    var body: some View {
        NavigationView {
            Form {
                  Section(header: Text("Select Building Type")) {
                      Picker(selection: self.$selectedType, label: Text("Select Type")) {
                          ForEach(BuildingTypes.allCases, id: \.self) {value in
                              Text(value.localizedName).tag(value)
                          }
                      }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                        .frame(width: 150, height: 150)
                  }
              }
              .navigationBarTitle("Building Types")
              .navigationBarItems(trailing:
                  Button(action: {
                      self.showFilteredView.toggle()
                  }) {
                      Image(systemName: "bell.circle.fill")
                          .font(Font.system(.title))
                  }
                    .padding()
                    .sheet(isPresented: $showFilteredView) {
                        FilteredBuildingView(isPresented: self.$showFilteredView, category: self.selectedType).environmentObject(self.buildings)
                })
        }
    }
}

struct BuildingView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingView()
    }
}


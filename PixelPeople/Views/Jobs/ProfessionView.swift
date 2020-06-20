//
//  JobView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionView: View {
    @State var showFilteredView = false
    @State private var selectedGenome: Genomes = .academic
    
    let professions = Professions()
    
    var body: some View {
        NavigationView {
            Form {
                  Section(header: Text("Select Genome")) {
                      Picker(selection: self.$selectedGenome, label: Text("Select Genome")) {
                          ForEach(Genomes.allCases, id: \.self) {value in
                              Text(value.localizedName).tag(value)
                          }
                      }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                  }
              }
              .navigationBarTitle("Professions")
              .navigationBarItems(trailing:
                  Button(action: {
                      self.showFilteredView.toggle()
                  }) {
                      Image(systemName: "bell.circle.fill")
                          .font(Font.system(.title))
                  }
                    .padding()
                    .sheet(isPresented: $showFilteredView) {
                        FilteredGenomeView(isPresented: self.$showFilteredView, genome: self.selectedGenome).environmentObject(self.professions)
                })
        }
    }

}

struct ProfessionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionView()
    }
}

//
//  AnimalFilters.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/30/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionFilters: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var professions: Professions
    @Binding var isPresented: Bool

    @State private var showGenomeFilter = false
    @State private var showCloneFilter = false
    
    @State private var selectedGenome = GenomeFilter.creative
    @State private var selectedClone = ProfessionFilter.mayor
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: HeaderText(header: "Genomes")) {
                    Picker(selection: self.$selectedGenome, label: Text("Select Genome")) {
                        ForEach(GenomeFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.labelsHidden()
                    
                    Button(action: {self.showGenomeFilter.toggle()}) {
                        Text("Filter by Genome")
                            .foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showGenomeFilter) {
                        ProfessionGenomeFilter(professions: self.professions, isPresented: self.$isPresented, filter: self.selectedGenome)}
                }
                
                Section(header: HeaderText(header: "Clones")) {
                    Picker(selection: self.$selectedClone, label: Text("Select Clone")) {
                        ForEach(ProfessionFilter.allCases, id: \.self) {value in
                            Text(value.localizedName).tag(value)
                        }
                    }.labelsHidden()
                    
                    Button(action: {self.showCloneFilter.toggle()}) {
                        Text("Filter by Clone")
                            .foregroundColor(Color.blue).offset(x: 200, y: 0)
                    }.sheet(isPresented: $showCloneFilter) {
                        ProfessionCloneFilter(professions: self.professions, isPresented: self.$isPresented, filter: self.selectedClone)}
                }
                }
                .navigationBarTitle("Profession Filters", displayMode: .inline)
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

struct ProfessionFilters_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionFilters(professions: Professions(), isPresented: .constant(true))
    }
}

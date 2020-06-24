//
//  GenomeView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/26/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct FilteredGenomeView: View {
    @EnvironmentObject var professions: Professions
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let genome: Genomes
    let dg = DragGesture()
    
    var filteredProfessions: [Profession] {
        return professions.professions.filter { $0.genome == genome.rawValue}
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                     GridView(rows: filteredProfessions.count/4, columns: 4, content: card)
                     Spacer()
                }
            //     .background(Color.gray)
                 .padding()
            //     .sheet(isPresented: $showDetailView) {
            //         AnimalDetailsView(isPresented: self.$showDetailView, animal: self.filteredAnimals[1])
            //             .highPriorityGesture(self.dg)
            //     }
                 .popover(isPresented: $showDetailView) {
                     ProfessionDetailsView(isPresented: self.$showDetailView, profession: self.filteredProfessions[1])
                     .highPriorityGesture(self.dg)
                 }
                 .navigationBarTitle("\(genome.rawValue)", displayMode: .inline)
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
        let profession = filteredProfessions[index]
        
        return JobThumb(showDetail: $showDetailView, profession: profession)
            .accessibility(addTraits: .isButton)
            .accessibility(label: Text("Open \(profession.name) Detail"))
    }
}

struct JobThumb: View {
    @Binding var showDetail: Bool
    var profession: Profession
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
        }) {
            VStack {
                Image(profession.image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                Text(profession.name)
                    .scaledFont(name: "Georgia", size: 8)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct FilteredGenomeView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredGenomeView(isPresented: .constant(true), genome: .academic)
    }
}

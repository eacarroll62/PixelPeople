//
//  GenomeView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/26/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

var index: String = ""

struct FilteredGenomeView: View {
    @ObservedObject var professions: Professions
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let genome: Filter
    let dg = DragGesture()
    
    var filteredProfessions: [Profession] {
        var filterProfessions = professions.professions.filter { $0.genome == genome.rawValue}
        let mod = filterProfessions.count % 4
        
        switch mod {
        case 1:
            for _ in 1...3 {
                filterProfessions.append(professions.professions[professions.professions.endIndex - 1])
            }
        case 2:
            for _ in 1...2 {
                filterProfessions.append(professions.professions[professions.professions.endIndex - 1])
            }
        case 3:
            filterProfessions.append(professions.professions[professions.professions.endIndex - 1])
        default:
            print("\(filterProfessions.count)")
        }
        
        return filterProfessions
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                     GridView(rows: filteredProfessions.count/4, columns: 4, content: card)
                     Spacer()
                }
                 .padding()
                 .sheet(isPresented: $showDetailView) {
                    ProfessionDetailsView(isPresented: self.$showDetailView, profession: self.filteredProfessions[self.filteredProfessions.firstIndex(where: {$0.name == index}) ?? 0])
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

struct FilteredGenomeView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredGenomeView(professions: Professions(), isPresented: .constant(true), genome: .academic)
    }
}

//
//  DetailView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/28/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionGenomeFilter: View {
    @ObservedObject var professions: Professions
    @State var isPresented = true
    @State private var showDetailView = false
    
    let dg = DragGesture()
    let filter: GenomeFilter
    
    var filteredProfessions: [Profession] {
        var filterProfessions: [Profession]
        
        filterProfessions = professions.professions.filter { $0.genome.contains(filter.rawValue) }
        
        let mod = professions.professions.count % 4
      
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
            break
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
                .navigationBarTitle("\(filter.rawValue)", displayMode: .inline)
                .navigationBarItems(trailing: ExitButton(isPresented: self.$isPresented))
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

struct ProfessionGenomeFilter_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionGenomeFilter(professions: Professions(), isPresented: true, filter: .explorers)
    }
}

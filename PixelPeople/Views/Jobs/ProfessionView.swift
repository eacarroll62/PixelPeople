//
//  JobView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionView: View {
    @State private var showDetailView = false
    @State private var showProfessionFilters = false
    
    let professions = Professions()
    let dg = DragGesture()
    
    var filteredProfessions: [Profession] {
        var filterProfessions: [Profession]

        filterProfessions = professions.professions.filter { $0.name != "Empty"}
        
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
                .navigationBarTitle("Pixel People Professions", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {self.showProfessionFilters = true}) {
                        Text("Filters")
                    }
                    .sheet(isPresented: $showProfessionFilters) {
                        ProfessionFilters(professions: self.professions, isPresented: self.$showProfessionFilters)
                            .highPriorityGesture(self.dg)
                    }
                )
                .sheet(isPresented: $showDetailView) {
                    ProfessionDetailsView(isPresented: self.$showDetailView, profession: self.filteredProfessions[self.filteredProfessions.firstIndex(where: {$0.name == index}) ?? 0])
                    .highPriorityGesture(self.dg)
                }
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

struct ProfessionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionView()
    }
}

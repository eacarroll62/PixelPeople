//
//  DetailView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/28/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct FilterProfessions: View {
    @ObservedObject var professions: Professions
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    let dg = DragGesture()
    let filter: ProfessionFilter
    let property: Property
    var title: String
    
    var filteredProfessions: [Profession] {
        var filterProfessions: [Profession]
        
        switch property {
        case .season:
            filterProfessions = professions.professions.filter { $0.genome.contains(filter.rawValue) }
        case .category:
            filterProfessions = professions.professions.filter { $0.genome.contains(filter.rawValue) }
        case .tier:
            filterProfessions = professions.professions.filter { $0.genome.contains(filter.rawValue) }
        case .parent:
            filterProfessions = professions.professions.filter { $0.genome.contains(filter.rawValue) }
        case .genome:
            filterProfessions = professions.professions.filter { $0.genome.contains(filter.rawValue) }
        case .clone:
            filterProfessions = professions.professions.filter {clone in clone.clones.contains(where: {clone in clone.name == filter.rawValue})}
        }
        
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
                }
                .padding()
                .sheet(isPresented: self.$showDetailView) {
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
    
    func makeTitle(property: Property) -> String {
        var title = ""
        switch property {
        case .season:
            break
        case .category:
            break
        case .tier:
            break
        case .parent:
            break
        case .genome:
            title = "Professions in the \(filter.rawValue) genome"
        case .clone:
            title = "Professions with the \(filter.rawValue) clone"
        }
        return title
    }
}

struct FilterProfessions_Previews: PreviewProvider {
    static var previews: some View {
        FilterProfessions(professions: Professions(), isPresented: .constant(true), filter: .mechanic, property: .clone, title: "Professions with the Mechanic clone")
    }
}

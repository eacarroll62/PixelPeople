//
//  GenomeView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/26/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

enum Genomes {
    case academic, administration, business, creative, curious, enchanted, evil, explorers, hospitality, law, media, medical, music, performers, production, resident, services, special, sports, technical, transport
}

struct GenomeView: View {
    @EnvironmentObject var professions: Professions
    let genome: Genomes
    
    var filteredProfessions: [Profession] {
        return professions.profession.filter { $0.genome == title}
        
    }

    var title: String {
        switch genome {
        case .academic:
            return "Academic"
        case .administration:
            return "Administration"
        case .business:
            return "Business"
        case .creative:
            return "Creative"
        case .curious:
            return "Curious"
        case .enchanted:
            return "Enchanted"
        case .evil:
            return "Evil"
        case .explorers:
            return "Explorers"
        case .hospitality:
            return "Hospitality"
        case .law:
            return "Law"
        case .media:
            return "Media"
        case .medical:
            return "Medical"
        case .music:
            return "Music"
        case .performers:
            return "Performers"
        case .production:
            return "Production"
        case .resident:
            return "Resident"
        case .services:
            return "Services"
        case .special:
            return "Special"
        case .sports:
            return "Sports"
        case .technical:
            return "Technical"
        case .transport:
            return "Transport"
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProfessions) { profession in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: ProfessionDetailsView(profession: profession)) {
                            Text(profession.name)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("\(title) Genome"), displayMode: .inline)
        }
    }
}

struct GenomeView_Previews: PreviewProvider {
    static var previews: some View {
        GenomeView(genome: .academic)
    }
}

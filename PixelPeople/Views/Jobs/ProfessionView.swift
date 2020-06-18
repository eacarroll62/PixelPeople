//
//  JobView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionView: View {
    let professions = Professions()
    
    var body: some View {
        UITabBarWrapper([
                TabBarElement(tabBarElementItem: .init(title: "Academic", systemImageName: "person.3")) {
                    GenomeView(genome: .academic)
                },
                TabBarElement(tabBarElementItem: .init(title: "Administration", systemImageName: "person.3")) {
                    GenomeView(genome: .administration)
                },
                TabBarElement(tabBarElementItem: .init(title: "Business", systemImageName: "checkmark.circle")) {
                    GenomeView(genome: .business)
                },
                TabBarElement(tabBarElementItem: .init(title: "Creative", systemImageName: "questionmark.diamond")) {
                    GenomeView(genome: .creative)
                },
                TabBarElement(tabBarElementItem: .init(title: "Curious", systemImageName: "house.fill")) {
                    GenomeView(genome: .curious)
                },
                TabBarElement(tabBarElementItem: .init(title: "Enchanted", systemImageName: "person.2")) {
                    GenomeView(genome: .enchanted)
                },
                TabBarElement(tabBarElementItem: .init(title: "Evil", systemImageName: "globe")) {
                    GenomeView(genome: .evil)
                },
                TabBarElement(tabBarElementItem: .init(title: "Explorers", systemImageName: "person")) {
                    GenomeView(genome: .explorers)
                },
                TabBarElement(tabBarElementItem: .init(title: "Hospitality", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .hospitality)
                },
                TabBarElement(tabBarElementItem: .init(title: "Law", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .law)
                },
                TabBarElement(tabBarElementItem: .init(title: "Media", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .media)
                },
                TabBarElement(tabBarElementItem: .init(title: "Medical", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .medical)
                },
                TabBarElement(tabBarElementItem: .init(title: "Music", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .music)
                },
                TabBarElement(tabBarElementItem: .init(title: "Performers", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .performers)
                },
                TabBarElement(tabBarElementItem: .init(title: "Production", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .production)
                },
                TabBarElement(tabBarElementItem: .init(title: "Resident", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .resident)
                },
                TabBarElement(tabBarElementItem: .init(title: "Services", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .services)
                },
                TabBarElement(tabBarElementItem: .init(title: "Special", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .special)
                },
                TabBarElement(tabBarElementItem: .init(title: "Sports", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .sports)
                },
                TabBarElement(tabBarElementItem: .init(title: "Technical", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .technical)
                },
                TabBarElement(tabBarElementItem: .init(title: "Transport", systemImageName: "link.circle.fill")) {
                    GenomeView(genome: .transport)
                }
            ]
        )
        .environmentObject(professions)
    }
}

struct ProfessionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionView()
    }
}

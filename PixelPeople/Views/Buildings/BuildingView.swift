//
//  BuildingView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingView: View {
    var buildings = Buildings()
    
    var body: some View {
        NavigationView {
            UITabBarWrapper([
                    TabBarElement(tabBarElementItem: .init(title: "Administration", systemImageName: "person.3")) {
                        CategoryView(category: .administration)
                    },
                    TabBarElement(tabBarElementItem: .init(title: "Business", systemImageName: "checkmark.circle")) {
                        CategoryView(category: .business)
                    },
                    TabBarElement(tabBarElementItem: .init(title: "Creative", systemImageName: "questionmark.diamond")) {
                        CategoryView(category: .creative)
                    },
                    TabBarElement(tabBarElementItem: .init(title: "Entertainment", systemImageName: "house.fill")) {
                        CategoryView(category: .entertainment)
                    },
                    TabBarElement(tabBarElementItem: .init(title: "F&B", systemImageName: "person.2")) {
                        CategoryView(category: .fb)
                    },
                    TabBarElement(tabBarElementItem: .init(title: "Science", systemImageName: "globe")) {
                        CategoryView(category: .science)
                    },
                    TabBarElement(tabBarElementItem: .init(title: "Services", systemImageName: "person")) {
                        CategoryView(category: .services)
                    },
                    TabBarElement(tabBarElementItem: .init(title: "None", systemImageName: "link.circle.fill")) {
                        CategoryView(category: .none)
                    }
                ]
            )
            .environmentObject(buildings)
            .navigationBarItems(leading: Button("Save") {
                self.buildings.save()
            })
        }
    }
}

struct BuildingView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingView()
    }
}


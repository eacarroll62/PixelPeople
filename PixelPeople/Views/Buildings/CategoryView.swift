//
//  CategoryView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 1/25/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

enum Categories {
    case administration, business, creative, entertainment, fb, science, services, none
}

struct CategoryView: View {
    @EnvironmentObject var buildings: Buildings
    let category: Categories
    
    var filteredBuildings: [Building] {
        return buildings.buildings.filter { $0.category == title}

    }
    
    var title: String {
        switch category {
        case .administration:
            return "Administration"
        case .business:
            return "Business"
        case .creative:
            return "Creative"
        case .entertainment:
            return "Entertainment"
        case .fb:
            return "F&B"
        case .science:
            return "Science"
        case .services:
            return "Services"
        case .none:
            return "None"
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBuildings) { building in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: BuildingDetailsView(building: building)) {
                            Text(building.name)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("\(title)"), displayMode: .inline)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .business)
    }
}

//
//  BuildingView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingView: View {
    let building: Building

    struct JobRecipe {
        let id: UUID = UUID()
        let clone: Profession
    }
    
    let professions: [JobRecipe]
    
    init(building: Building, professions: [Profession]) {
        self.building = building
        var matches = [JobRecipe]()
        
        for job in building.jobs {
            if let match = professions.first(where: { $0.name == job.name}) {
                matches.append(JobRecipe(clone: match))
            } else {
                fatalError("Missing \(job)")
            }
        }
        self.professions = matches
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Image(self.building.image)
                            .resizable()
                            .frame(maxWidth: geometry.size.width * 0.5)
                        VStack(alignment: .leading) {
                            Text("Level: \(self.building.level)")
                            Text("Land Cost: \(self.building.landCost)")
                            Text("Adj. Work Time: \(self.building.adjustedWorkTime)")
                            Text("CPS: \(self.building.cps)")
                            Spacer()
                        }
                    }.padding(.horizontal)
                    
                    Text("Professions:")
                        .font(.largeTitle)
                    
                    ForEach(self.professions, id: \.id) { job in
                        NavigationLink(destination: ProfessionView(profession: job.clone)) {
                            Text(job.clone.name)
                                .font(.headline)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
            .navigationBarTitle(Text(self.building.name), displayMode: .inline)
    }
}

struct BuildingView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static var previews: some View {
        BuildingView(building: buildings[0], professions: professions)
    }
}

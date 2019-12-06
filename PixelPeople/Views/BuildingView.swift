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
    @State private var isBuildingBuilt = false
    @State private var isBuildingFull = false
    
/*
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
*/
    var body: some View {
        GeometryReader { geometry in
            Form {
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
                    
                    Toggle(isOn: self.$isBuildingBuilt) {
                        Text("Is the Building Built?")
                    }
                    
                    if self.isBuildingBuilt {
                        Toggle(isOn: self.$isBuildingFull) {
                            Text("Is the Building Full?")
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Professions:")
                            .font(.largeTitle)
                        
                        ForEach(self.building.jobs, id: \.id) { clone in
                            NavigationLink(destination: ProfessionView(profession: clone)) {
                                Text(clone.name)
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
            .navigationBarTitle(Text(self.building.name), displayMode: .inline)
    }
}

struct BuildingView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    
    static var previews: some View {
        BuildingView(building: buildings[0])
    }
}

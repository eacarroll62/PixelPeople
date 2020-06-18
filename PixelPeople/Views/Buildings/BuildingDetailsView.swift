//
//  BuildingDetailsView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 12/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingDetailsView: View {
    var building: Building
//    @EnvironmentObject private var building: Buildings
    @State private var level = "1"
    @State private var isBuilt = false
    
    var body: some View {
        ZStack {
            Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
            
            VStack {
                BuildingInfoView(landCost: building.landCost, coinSecond: building.cps, workTime: building.adjustedWorkTime, level: building.level)
                Image(building.image).asThumbnail()
            
                List(self.building.jobs) { job in
                    NavigationLink(destination: ProfessionDetailsView(profession: job)) {
                        Text(job.name)
                            .font(.title)
                            .padding([.leading, .trailing], 2)
                    }
                }
                    .background(Color.lightBlue)
                    .navigationBarTitle(Text("\(building.name)"), displayMode: .inline)
                    
 
            }
 
        }
    }
    
    var aspectRatio: CGFloat {
            let size
                = UIImage(named: building.image)?.size
                    ?? CGSize(width: 1, height: 1)
            return size.width/size.height
    }
}

struct BuildingDetailsView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static var previews: some View {
        BuildingDetailsView(building: buildings[102])
    }
}

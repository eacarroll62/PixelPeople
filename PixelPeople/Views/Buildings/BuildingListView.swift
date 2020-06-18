//
//  BuildingListView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 3/15/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingListView: View {
    var building: Building
    
    var body: some View {
        List(building.jobs) { job in
            NavigationLink(destination: ProfessionDetailsView(profession: job)) {
                Text(job.name)
                    .font(.title)
           //         .padding([.leading, .trailing], 2)
                    .background(Color.lightBlue)
            }
        }
            .padding(.leading, 10)
            .frame(width: 275, height: 46 * CGFloat(building.jobs.count), alignment: .center)
            .overlay(Rectangle().stroke(Color.black, lineWidth: 5))
            .padding(.top, 50)
    }
}

struct BuildingListView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static let building = buildings[100]
    static var previews: some View {
        BuildingListView(building: building)
    }
}

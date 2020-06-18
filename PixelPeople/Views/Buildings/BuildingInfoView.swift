//
//  BuildingInfoView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 3/15/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingInfoView: View {
    var landCost: Int
    var coinSecond: Int
    var workTime: Int
    var level: Int
    @State private var isBuilt = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $isBuilt) {
                Text("Building Built?")
            }
            .padding([.trailing], 120)
            .toggleStyle(CheckboxToggleStyle())
            .onTapGesture {
                self.isBuilt = true
                
            }
            
            HStack {
                Text("Level: \(level)")
                Button(action: {
  //                  if self.building.level < 6 {
  //                      self.building.level += 1
  //                      self.level = String(self.building.level)
                        print("Test")
  //                  }
                }, label: { Image(systemName: "plus.square") })
            }
            
            Text("Land Cost: \(landCost)")
            Text("Coins per Second: \(coinSecond)")
            Text("Adjusted Work Time: \(workTime)")
        }
            .padding(.leading, 10)
            .frame(width: 275, height: 160, alignment: .center)
            .overlay(Rectangle().stroke(Color.black, lineWidth: 5))
            .background(Color.lightBlue)
            .padding(.top, 50)
    }
}

struct BuildingInfoView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static let building = buildings[100]
    static var previews: some View {
        BuildingInfoView(landCost: building.landCost, coinSecond: building.cps, workTime: building.adjustedWorkTime, level: building.level)
    }
}

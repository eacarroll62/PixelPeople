//
//  BuildingDetailsView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 12/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingDetailsView: View {
    @Binding var isPresented: Bool
    
    @State private var showBuildingInfo = false
    
    var building: Building
    
    let colors: [String : [Color]] = ["Administration": [Color.olive, Color.oliveYellow],
                                      "Business": [Color.gray, Color.black],
                                      "Creative": [Color.yellowGreen, Color.greenYellow],
                                      "Entertainment": [Color.fluorescentOrange, Color.darkOrange],
                                      "F&B": [Color.yellowGreen, Color.greenYellow],
                                      "Science": [Color.yellowGreen, Color.greenYellow],
                                      "Services": [Color.yellowGreen, Color.greenYellow],
                                      "None": [Color.yellowGreen, Color.greenYellow],
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colors[building.category]![0])
                        .frame(width: 320, height: 520)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 304, height: 504)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colors[building.category]![1])
                        .frame(width: 244, height: 354)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(gradient: Gradient(colors: [colors[building.category]![0], colors[building.category]![1]]), startPoint: UnitPoint(x: 100, y: 150), endPoint: UnitPoint(x: 100, y: 300)))
                        .frame(width: 300, height: 500)
                    Rectangle()
                        .fill(colors[building.category]![0])
                        .frame(width: 205, height: 35)
                        .offset(x: 0, y: -243)
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 200, height: 30)
                        .offset(x: 0, y: -243)
                }
                Image(building.image)
                    .resizable()
                    .frame(width: 128, height: 128)
                    .offset(x: 0, y: -100)
                Text(building.name.uppercased())
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(x: 0, y: -25)
                Text("Land Cost: \(building.landCost)")
                    .foregroundColor(.white)
                    .font(.body)
                    .fontWeight(.bold)
                    .offset(x: 0, y: 20)
                Text(building.category.uppercased())
                    .foregroundColor(.white)
                    .offset(x: 0, y: -241)
                Button(action: {self.isPresented = false}) {
                    Image(systemName: "clear.fill")
                    .resizable()
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .foregroundColor(Color.red)
                }.offset(x: 130, y: -230)
                Button(action: {
                    self.showBuildingInfo = true
                }) {
                    Text("More...")
                        .foregroundColor(.white)
                }
                .offset(x: -100, y: 225)
                .sheet(isPresented: $showBuildingInfo) {BuildingInfoView(building: self.building)}
            }
        }.offset(x: 0, y: -50)
    }
    
    var aspectRatio: CGFloat {
            let size = UIImage(named: building.image)?.size ?? CGSize(width: 1, height: 1)
            return size.width/size.height
    }
}

struct BuildingDetailsView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static var previews: some View {
        BuildingDetailsView(isPresented: .constant(true), building: buildings[88])
    }
}

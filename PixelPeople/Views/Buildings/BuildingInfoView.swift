//
//  BuildingInfoView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 3/15/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingInfoView: View {
    var building: Building
    
    let colors: [String : [Color]] = ["Administration": [Color.olive, Color.oliveYellow],
                                      "Business": [Color.yellowGreen, Color.greenYellow],
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
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .frame(width: 280, height: 396)
                    ForEach(0..<building.jobs.count) {
                        BuildingCloneRow(building: self.building, profession: self.building.jobs[$0])
                            .offset(x: 0, y: CGFloat(-165 + $0 * 66))
                    }
                    
                }
                Text(building.name.uppercased())
                    .foregroundColor(.white)
                    .offset(x: 0, y: -241)
                Button(action: {
    //                self.isPresented = false
                }) {
                    Image(systemName: "clear.fill")
                    .resizable()
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .foregroundColor(Color.red)
                }
                .offset(x: 130, y: -230)
            }
        }.offset(x: 0, y: -50)
    }
    
    var aspectRatio: CGFloat {
            let size = UIImage(named: building.image)?.size ?? CGSize(width: 1, height: 1)
            return size.width/size.height
    }
}

struct BuildingInfoView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static var previews: some View {
        BuildingInfoView(building: buildings[29])
    }
}


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
    
    var building: Building
    
    let colors: [String : [Color]] = ["Administration": [Color.olive, Color.oliveYellow],
                                      "Business": [Color.gray, Color.black],
                                      "Creative": [Color.yellowGreen, Color.greenYellow],
                                      "Entertainment": [Color.yellowGreen, Color.greenYellow],
                                      "F&B": [Color.yellowGreen, Color.greenYellow],
                                      "Science": [Color.yellowGreen, Color.greenYellow],
                                      "Services": [Color.yellowGreen, Color.greenYellow],
                                      "Nome": [Color.fluorescentOrange, Color.darkOrange],
    ]
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 10)
                    .fill(colors[building.category]![1])
                    .frame(width: 320, height: 520)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: 304, height: 504)
                RoundedRectangle(cornerRadius: 10)
                    .fill(colors[building.category]![0])
                    .frame(width: 300, height: 500)
                RoundedRectangle(cornerRadius: 10)
                    .fill(colors[building.category]![1])
                    .frame(width: 244, height: 354)
                RoundedRectangle(cornerRadius: 10)
                    .fill(RadialGradient(gradient: Gradient(colors: [.whiteSmoke, .black]), center: .center, startRadius: 5, endRadius: 180))
                    .frame(width: 240, height: 350)
            }
            Image(building.image)
            .resizable()
            .frame(width: 128, height: 128)
 
        }
    }
    
    var aspectRatio: CGFloat {
            let size = UIImage(named: building.image)?.size ?? CGSize(width: 1, height: 1)
            return size.width/size.height
    }
}

struct BuildingDetailsView_Previews: PreviewProvider {
    static let buildings: [Building] = Bundle.main.decode([Building].self, from: "buildings.json")
    static var previews: some View {
        BuildingDetailsView(isPresented: .constant(true), building: buildings[0])
    }
}

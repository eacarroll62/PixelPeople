//
//  ProfessionDetailsView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 12/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionDetailsView: View {
    @Binding var isPresented: Bool
    
    var profession: Profession
    
    let colors: [String : [Color]] = ["Academic": [Color.purple2,Color.fuchsia],
                                      "Administration": [Color.olive, Color.oliveYellow],
                                      "Business": [Color.gray, Color.black],
                                      "Creative": [Color.yellowGreen, Color.greenYellow],
                                      "Curious": [Color.yellowGreen, Color.greenYellow],
                                      "Enchanted": [Color.yellowGreen, Color.greenYellow],
                                      "Evil": [Color.yellowGreen, Color.greenYellow],
                                      "Explorers": [Color.yellowGreen, Color.greenYellow],
                                      "Hospitality": [Color.fluorescentOrange, Color.darkOrange],
                                      "Law": [Color.law, Color.lawBorder],
                                      "Media": [Color.yellowGreen, Color.greenYellow],
                                      "Medical": [Color.yellowGreen, Color.greenYellow],
                                      "Music": [Color.yellowGreen, Color.greenYellow],
                                      "Performers": [Color.yellowGreen, Color.greenYellow],
                                      "Production": [Color.yellowGreen, Color.greenYellow],
                                      "Resident": [Color.yellowGreen, Color.greenYellow],
                                      "Services": [Color.yellowGreen, Color.greenYellow],
                                      "Special": [Color.yellowGreen, Color.greenYellow],
                                      "Sports": [Color.crimson, Color.deepPink],
                                      "Technical": [Color.metallicGold, Color.goldYellow],
                                      "Transport": [Color.yellowGreen, Color.greenYellow]
                                     ]
    
    var body: some View {
        NavigationView {
            ZStack() {
                Group {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colors[profession.genome]![1])
                        .frame(width: 320, height: 520)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 304, height: 504)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colors[profession.genome]![0])
                        .frame(width: 300, height: 500)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colors[profession.genome]![1])
                        .frame(width: 244, height: 354)
                    RoundedRectangle(cornerRadius: 10)
                        .trim(from: 0, to: 0.25)
                        .fill(Color.lightSeaGreen)
                        .rotationEffect(.degrees(180))
                        .frame(width: 180, height: 180)
                        .offset(x: -70, y: -170)
                    RoundedRectangle(cornerRadius: 10)
                        .trim(from: 0, to: 0.25)
                        .fill(Color.green)
                        .rotationEffect(.degrees(180))
                        .frame(width: 150, height: 150)
                        .offset(x: -75, y: -175)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(RadialGradient(gradient: Gradient(colors: [.olive, .black]), center: .center, startRadius: 5, endRadius: 180))
                        .frame(width: 240, height: 350)
                }
                Image(profession.image)
                    .resizable()
                    .frame(width: 128, height: 128)
                Text(profession.genome)
                    .font(.subheadline)
                    .bold()
                    .offset(x: 0, y: 155)
                    .foregroundColor(Color.white)
                Text(profession.name)
                    .font(.title)
                    .bold()
                    .offset(x: 0, y: 125)
                    .foregroundColor(Color.white)
                Text("\(profession.clones[0].name)\n+\n\(profession.clones[1].name)")
                    .font(.subheadline)
                    .bold()
                    .multilineTextAlignment(.center)
                    .offset(x: 0, y: -140)
                    .foregroundColor(Color.white)
                Text("1")
                    .font(.title)
                    .bold()
                    .offset(x: -135, y: -230)
                    .foregroundColor(Color.white)
                Text("cps")
                    .font(.footnote)
                    .bold()
                    .offset(x: -115, y: -235)
                    .foregroundColor(Color.white)
                Button(action: {
                    self.isPresented = false
                }) {
                    Image(systemName: "clear.fill")
                    .resizable()
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .foregroundColor(Color.red)
                }
                .offset(x: 130, y: -230)
            }.offset(x: 0, y: -50)
        }
    }
}

struct ProfessionDetailsView_Previews: PreviewProvider {
    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static var previews: some View {
        ProfessionDetailsView(isPresented: .constant(true), profession: professions[13])
    }
}

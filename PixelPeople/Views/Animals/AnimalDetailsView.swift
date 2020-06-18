//
//  AnimalDetailsView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 12/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct AnimalDetailsView: View {
    @Binding var isPresented: Bool
    
//    @State private var showDetailView = false
    var animal: Animal
    let colorDictionary: [Int : [Color]] = [1: [Color.lightSeaGreen, Color.teal],
                                            2: [Color.metallicGold, Color.goldYellow],
                                            3: [Color.yellowGreen, Color.greenYellow],
                                            4: [Color.crimson, Color.deepPink],
                                            5: [Color.fluorescentOrange, Color.darkOrange]
    ]
    
    var seasonString: String {
        switch animal.season {
        case "Any":
            return "\(animal.season.uppercased()) SEASON"
        case "Altar":
            return "SPLICED AT \n THE ALTAR"
        default:
            return "MORE FREQUENT \n DURING \(animal.season.uppercased())"
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack() {
                Group {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colorDictionary[animal.tier]![1])
                        .frame(width: 320, height: 520)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 304, height: 504)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colorDictionary[animal.tier]![0])
                        .frame(width: 300, height: 500)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colorDictionary[animal.tier]![1])
                        .frame(width: 244, height: 354)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(RadialGradient(gradient: Gradient(colors: [.whiteSmoke, .black]), center: .center, startRadius: 5, endRadius: 180))
                        .frame(width: 240, height: 350)
                }
                Image(animal.image)
                    .resizable()
                    .frame(width: 128, height: 128)
                Group {
                    Text(animal.name)
                        .font(.title)
                        .bold()
                        .offset(x: 0, y: 125)
                        .foregroundColor(Color.white)
                    Text(animal.scientific)
                        .font(.headline)
                        .bold()
                        .offset(x: 0, y: 150)
                        .foregroundColor(Color.white)
                    Text("Tier \(animal.tier)")
                        .font(.headline)
                        .bold()
                        .offset(x: -100, y: -190)
                        .foregroundColor(Color.white)
                    Text(seasonString)
                        .font(.system(size: 14))
                        .bold()
                        .multilineTextAlignment(.center)
                        .offset(x: 0, y: -210)
                        .foregroundColor(Color.white)
                    Text("Category  \(animal.category.joined(separator: " "))")
                        .font(.caption)
                        .bold()
                        .offset(x: 0, y: 200)
                        .foregroundColor(Color.white)
                    Text(animal.parents.joined(separator: " + "))
                        .font(.subheadline)
                        .bold()
                        .offset(x: 0, y: -150)
                        .foregroundColor(Color.white)
                }
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

struct AnimalDetailsView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode([Animal].self, from: "animals.json")
    static var previews: some View {
        AnimalDetailsView(isPresented: .constant(true), animal: animals[32])
    }
}

//
//  AnimalThumb.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/27/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct AnimalThumb: View {
    @Binding var showDetail: Bool
    
    var animal: Animal
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
            index = self.animal.name
        }) {
            VStack {
                Image(animal.image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                    .background(Color.black)
                Text(animal.name)
                    .scaledFont(name: "Georgia", size: 8)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct AnimalThumb_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode([Animal].self, from: "animals.json")
    static var previews: some View {
        AnimalThumb(showDetail: .constant(true), animal: animals[0])
    }
}

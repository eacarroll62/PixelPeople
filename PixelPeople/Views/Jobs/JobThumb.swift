//
//  ProfessionThumb.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/30/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct JobThumb: View {
    @Binding var showDetail: Bool
    var profession: Profession
    
    var body: some View {
        Button(action: {
            self.showDetail.toggle()
            index = self.profession.name
        }) {
            VStack {
                Image(profession.image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                Text(profession.name)
                    .scaledFont(name: "Georgia", size: 8)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ProfessionThumb_Previews: PreviewProvider {
    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static var previews: some View {
        JobThumb(showDetail: .constant(true), profession: professions[0])
    }
}

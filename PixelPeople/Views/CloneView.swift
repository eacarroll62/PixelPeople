//
//  CloneView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/30/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct CloneView: View {
    let profession: Profession
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    Image(profession.image!)
                        .resizable()
                        .scaledToFit()
                    Text(profession.name)
                        .font(.headline)
                }
                    .frame(width: 300, height: 100)
            }
                .background(Color.blue)
                .foregroundColor(.white)
        }
    }
}

struct CloneView_Previews: PreviewProvider {
    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static var previews: some View {
        CloneView(profession: professions[10])
    }
}

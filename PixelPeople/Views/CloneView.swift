//
//  CloneView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/30/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct CloneView: View {
    let clone: Clone
    
    var body: some View {
        NavigationView {
            HStack {
                Image(clone.image)
                    .resizable()
                    .scaledToFit()
                Text(clone.name)
                    .font(.caption)
            }
            .frame(width: 300, height: 25)
                .foregroundColor(.white)
        }
    }
}

struct CloneView_Previews: PreviewProvider {
    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static var previews: some View {
        CloneView(clone: professions[10].clones![0])
    }
}


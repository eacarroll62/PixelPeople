//
//  JobView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionView: View {
    let profession: Profession
    
    init(profession: Profession) {
        self.profession = profession
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image(profession.image!)
                    Text(profession.name)
                        .font(.caption)
                }
                    .frame(width: 300, height: 300)
                VStack {
                    Text(profession.clone_1!)
                    Text(profession.clone_2!)
                }
            }
                .background(Color.blue)
                .foregroundColor(.white)
        }
    }
}

struct JobView_Previews: PreviewProvider {
    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static var previews: some View {
        ProfessionView(profession: professions[10])
    }
}

//
//  MenuView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 6/6/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        HStack {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
        /*
        NavigationView {
            Form {
                Text("Select:")
            }
            .frame(width: 150, height: 175)
            .contextMenu {
                NavigationLink(destination: BuildingView()) {
                    Text("Buildings")
                }
                NavigationLink(destination: ProfessionView()) {
                    Text("Professions")
                }
                NavigationLink(destination: AnimalView()) {
                    Text("Animals")
                }
            }
        }
*/
    }
/*
    let animalFilters = ["Category", "Season", "Name", "Tier"]
    @State private var animalFilter = 0
    @State var expand = false
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                HStack {
                    Text("Animals")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(Color.white)
                }.onTapGesture {
                    self.expand.toggle()
                }
                if expand {
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("Category").padding(10)
                    }.foregroundColor(Color.white)
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("Season").padding(10)
                    }.foregroundColor(Color.white)
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("Name").padding(10)
                    }.foregroundColor(Color.white)
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Text("Tier").padding(10)
                    }.foregroundColor(Color.white)
                }
            }
        }
    }
 */
}

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

//
//  HomeView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 2/5/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack(spacing: 1.0) {
            Image("Pixelpeople101")
                .padding([.leading, .trailing], 20)
            VStack {
                Text("Welcome")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("to")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Pixel People Companion")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .font(.system(size: 12))
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        .frame(width:300, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

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
        VStack {
            Text("Welcome to")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 20)
            Image("Pixelpeople101")
                .resizable()
                .frame(width: 256, height: 256)
                .padding([.leading, .trailing], 20)
            Text("Pixel People Companion")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 20)
        }
        .font(.system(size: 12))
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

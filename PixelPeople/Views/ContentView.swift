//
//  ContentView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/27/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showView = false
    
    var body: some View {
        /*
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .edgesIgnoringSafeArea(.all)
                Image("Pixelpeople101")
                .resizable()
                .frame(width: 256, height: 256)
            }
            .navigationBarTitle(Text("Pixel People Companion"), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showView.toggle()
                }) {
                    Image(systemName: "bell.circle.fill")
                        .font(Font.system(.title))
                }.sheet(isPresented: $showView) {
                    MenuView()
                }
            )
        }
        
  */
        TabView {
            
            HomeView().tabItem {
                Image(systemName: "globe")
                Text("Home")
            }
  //          BuildingView().tabItem {
  //              Image(systemName: "globe")
  //              Text("Buildings")
  //          }
            
            ProfessionView().tabItem {
                Image(systemName: "globe")
                Text("Jobs")
            }
            
            AnimalView().tabItem {
                Image(systemName: "globe")
                Text("Animals")
            }
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/27/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
 //       TabView {
        
        NavigationView {
            HomeView().tabItem {
                Image(systemName: "globe")
                Text("Home")
            }
            .offset(x: 0, y: -100)
            .navigationBarItems(trailing:
                HStack {
                    NavigationLink("Buildings", destination: BuildingView())
                    NavigationLink("Animals", destination: AnimalView())
                    NavigationLink("Professions", destination: ProfessionView())
                }
            )
        }
 
//            BuildingView().tabItem {
//                Image(systemName: "globe")
//                Text("Buildings")
//            }
            
//            ProfessionView().tabItem {
//                Image(systemName: "globe")
//                Text("Jobs")
//            }
            
//            AnimalView().tabItem {
//                Image(systemName: "globe")
//                Text("Animals")
//            }
 //       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  JobView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/28/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct ProfessionView: View {
    @State private var showDetailView = false
    
    let professions = Professions()
    let dg = DragGesture()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    GridView(rows: professions.professions.count/4, columns: 4, content: card)
                    Spacer()
                }
                .navigationBarTitle("Pixel People Professions", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {}) {
                        Text("Filters")
                    }
                )
                .sheet(isPresented: $showDetailView) {
                    ProfessionDetailsView(isPresented: self.$showDetailView, profession: self.professions.professions[self.professions.professions.firstIndex(where: {$0.name == index}) ?? 0])
                    .highPriorityGesture(self.dg)
                }
            }
        }
    }
        
    func card(atRow row: Int, column: Int) -> some View {
        let index = (row * 4) + column
        let profession = professions.professions[index]
        
        return JobThumb(showDetail: $showDetailView, profession: profession)
            .accessibility(addTraits: .isButton)
            .accessibility(label: Text("Open \(profession.name) Detail"))
    }
}

struct ProfessionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionView()
    }
}

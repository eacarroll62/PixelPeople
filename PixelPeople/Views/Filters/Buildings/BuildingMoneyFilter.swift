//
//  BuildingMoneyFilter.swift
//  PixelPeople
//
//  Created by Eric Carroll on 4/25/21.
//  Copyright © 2021 Eric Carroll. All rights reserved.
//

import SwiftUI

struct BuildingMoneyFilter: View {
    @ObservedObject var buildings: Buildings
    @Binding var isPresented: Bool
    @State private var showDetailView = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BuildingMoneyFilter_Previews: PreviewProvider {
    static var previews: some View {
        BuildingMoneyFilter(buildings: Buildings(), isPresented: .constant(true))
    }
}

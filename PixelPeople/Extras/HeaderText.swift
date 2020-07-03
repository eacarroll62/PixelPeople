//
//  HeaderText.swift
//  PixelPeople
//
//  Created by Eric Carroll on 7/2/20.
//  Copyright © 2020 Eric Carroll. All rights reserved.
//

import SwiftUI

struct HeaderText: View {
    let header: String
    
    var body: some View {
        Text(header)
            .font(.title)
            .foregroundColor(.yellow)
            .bold()
    }
}

struct HeaderText_Previews: PreviewProvider {
    static var previews: some View {
        HeaderText(header: "Test")
    }
}

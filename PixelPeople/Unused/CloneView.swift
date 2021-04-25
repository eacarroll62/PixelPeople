//
//  CloneView.swift
//  PixelPeople
//
//  Created by Eric Carroll on 11/30/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import SwiftUI

struct modifierPosition {
    var x: CGFloat
    var y: CGFloat
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                                
                        )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                                
                        )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(Color.darkEnd, lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    var startColor: Color
    var endColor: Color
    var overlayWidth: CGFloat
    var shadowRadius: CGFloat
//    var shadowPosition: modifierPosition
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(endColor, startColor))
                    .overlay(shape.stroke(LinearGradient(startColor, endColor), lineWidth: overlayWidth))
                    .shadow(color: Color.darkStart, radius: shadowRadius, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: shadowRadius, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(LinearGradient(startColor, endColor), lineWidth: overlayWidth))
                    .shadow(color: Color.darkStart, radius: shadowRadius, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: shadowRadius, x: 10, y: 10)
            }
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(30)
        .contentShape(Circle())
        .background(
            DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
        )
        .animation(nil)
    }
}

struct DarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            DarkBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(30)
        .contentShape(Circle())
        .background(
            ColorfulBackground(isHighlighted: configuration.isPressed, shape: Circle(), startColor: Color.lightStart, endColor: Color.lightEnd, overlayWidth: 4, shadowRadius: 10)
        )
        .animation(nil)
    }
}

struct ColorfulToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: Circle(), startColor: Color.lightStart, endColor: Color.lightEnd, overlayWidth: 4, shadowRadius: 10)
        )
    }
}

struct CloneView: View {
//    let clone: Clone
    @State private var isToggled = false
    @State private var selectedSeason = TierFilter.one
    var body: some View {
        /*
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
 
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
            
            VStack(spacing: 40) {
                Button(action: {
                    print("Button Tapped")
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
                .buttonStyle(ColorfulButtonStyle())
                
                Toggle(isOn: $isToggled) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
                .toggleStyle(ColorfulToggleStyle())
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    */
        Rectangle().fill(Color.green)
    
        
        
        /*
        NavigationView {
            Form {
                Picker("Select Season", selection: self.$selectedSeason) {
                    ForEach(73..<Filter.allCases.count, id: \.self) { value in
                        Text(SeasonFilter(hashValue: value)!.rawValue).tag(value)
                    }
                }
                Text("\(self.selectedSeason.rawValue) was picked")
            }
        }
 */
    }
}
// unsafeBitCast(UInt8(index), to: Self.self)
struct CloneView_Previews: PreviewProvider {
//    static let professions: [Profession] = Bundle.main.decode([Profession].self, from: "professions.json")
    static var previews: some View {
//        CloneView(clone: professions[10].clones![0])
        CloneView()
    }
}



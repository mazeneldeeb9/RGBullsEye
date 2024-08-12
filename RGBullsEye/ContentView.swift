//
//  ContentView.swift
//  RGBullsEye
//
//  Created by mazen eldeeb on 12/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var game: Game = Game()
    @State var guess: RGB = RGB()
    @State var showScore = false
    
    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87
    
    var target = RGB.random()
    
    var body: some View {
        GeometryReader { proxy in
            let screenHeight = proxy.size.height
            let screenWidth = proxy.size.width
            ZStack {
                Color.element
                VStack {
                    ColorCircle(size: screenHeight * circleSize, rgb: target)
                    
                    if !showScore {
                        BevelText(text: "R: ??? G: ??? B: ???", width: screenWidth * labelWidth, height: screenHeight * labelHeight)
                    } else {
                        BevelText(text: target.intString(), width: screenWidth * labelWidth, height: screenHeight * labelHeight)
                    }
                    ColorCircle(size: screenHeight * circleSize,rgb: guess)
                    BevelText(text: guess.intString(),  width: screenWidth * labelWidth, height: screenHeight * labelHeight)
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue
                                , trackColor: .blue)
                    
                    Button("Hit Me!") {
                        showScore = true
                        game.check(guess: guess)
                    }.alert(isPresented: $showScore) {
                        Alert(
                            title: Text("Your Score"),
                            message: Text(String(game.scoreRound)),
                            dismissButton: .default(Text("OK")) {
                                game.startNewRound()
                                guess = RGB()
                            })
                    }.buttonStyle(NeuButtonStyle(width: screenWidth * buttonWidth, height: screenHeight * labelHeight))
                    
                }.font(.headline)
                    .padding()
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }.font(.subheadline)
            .padding(.horizontal)
    }
}

struct ColorCircle: View {
    let size: Double
    var rgb: RGB
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.element)
                .northWestShadow()
            Circle()
                .fill(Color(red: rgb.red, green: rgb.green, blue: rgb.blue))
                .padding(20)
        }
        .frame(width: size, height: size)
    }
}

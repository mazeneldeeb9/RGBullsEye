//
//  NeuButtonStyle.swift
//  RGBullsEye
//
//  Created by mazen eldeeb on 12/08/2024.
//

import Foundation
import SwiftUI


struct NeuButtonStyle: ButtonStyle {
    let width: CGFloat
    let height: CGFloat
    func makeBody(configuration: Self.Configuration)
    -> some View {
        configuration.label
            .frame(width: 327, height: 48)
            .background(Group {
                if configuration.isPressed {
                    Capsule()
                        .fill(Color.element)
                        .southEastShadow()
                } else {
                    Capsule()
                        .fill(Color.element).northWestShadow()
                }
            })
            .opacity(configuration.isPressed ? 0.2 : 1)
    }
}

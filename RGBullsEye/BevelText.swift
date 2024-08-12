//
//  BevelText.swift
//  RGBullsEye
//
//  Created by mazen eldeeb on 12/08/2024.
//

import SwiftUI

struct BevelText: View {
    let text: String
    let width: Double
    let height: Double
    var body: some View {
        Text(text)
            .frame(width: width, height: height)
            .background(
                ZStack {
                    Capsule()
                       .fill(Color.element)
                       .northWestShadow(radius: 3, offset: 1)
                     Capsule()
                       .inset(by: 3)
                       .fill(Color.element)
                       .southEastShadow(radius: 1, offset: 1)
                }
               
            ).padding(.vertical, 6)
    }
}

#Preview {
    BevelText(text: "R: ??? G: ??? B: ???", width: 200, height: 48)
}

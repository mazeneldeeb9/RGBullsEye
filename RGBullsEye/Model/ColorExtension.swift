//
//  ColorExtension.swift
//  RGBullsEye
//
//  Created by mazen eldeeb on 12/08/2024.
//

import Foundation
import SwiftUI


extension Color {
  init(rgbStruct rgb: RGB) {
    self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
  }
    
}

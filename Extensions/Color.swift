//
//  Color.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 18.02.24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let red = Color("Reds")
    let green = Color("Greens")
    let secondaryText = Color("SecondaryTextColor")
}

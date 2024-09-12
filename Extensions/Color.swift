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
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let red = Color("Reds")
    let green = Color("Greens")
    let secondaryTextColor = Color("SecondaryTextColor")
}

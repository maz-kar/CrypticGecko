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
    let redColor = Color("RedColor")
    let greenColor = Color("GreenColor")
    let secondaryTextColor = Color("SecondaryTextColor")
}

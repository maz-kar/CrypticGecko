//
//  HeaderButtonView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

struct CircleButtonView: View {
    var iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accentColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.backgroundColor)
            )
            .shadow(
                color: Color.theme.accentColor.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "info")
        
        CircleButtonView(iconName: "chevron.right")
            .colorScheme(.dark)
    }
}

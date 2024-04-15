//
//  HeaderButtonView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

struct CircleButtonView: View {
    var buttonImage: String
    
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .foregroundStyle(Color.theme.backgroundColor)
            .shadow(color: Color.theme.accentColor.opacity(0.25),
                    radius: 2, x: 0, y: 0)
            .overlay {
                Image(systemName: buttonImage)
                    .bold()
                    .foregroundStyle(Color.theme.accentColor)
            }
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(buttonImage: "info")
        
        CircleButtonView(buttonImage: "chevron.right")
            .colorScheme(.dark)
    }
}

//
//  HeaderButtonView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

struct HeaderButtonView: View {
    
    var buttonImage: String
    
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .foregroundStyle(Color.theme.backgroundColor)
            .shadow(color: Color.theme.accentColor, radius: 2)
            .overlay {
                Image(systemName: buttonImage)
                    .bold()
                    .foregroundStyle(Color.theme.accentColor)
                
            }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        HeaderButtonView(buttonImage: "info")
        
        HeaderButtonView(buttonImage: "chevron.right")
            .colorScheme(.dark)
    }
    .padding()
}

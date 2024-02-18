//
//  ContentView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 06.02.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("AccentColor")
                    .foregroundStyle(Color.theme.accentColor)
                
                Text("RedColor")
                    .foregroundStyle(Color.theme.redColor)
                
                Text("GreenColor")
                    .foregroundStyle(Color.theme.greenColor)
                
                Text("SecondaryTextColor")
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
            .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}

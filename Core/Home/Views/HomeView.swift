//
//  HomeView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio = false
    
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                HStack() {
                    CircleButtonView(iconName: (showPortfolio ? "plus" : "info"))
                    Spacer()
                    
                    Text(showPortfolio ? "Portfolio" : "Live Prices")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.theme.accentColor)
                    Spacer()
                    
                    CircleButtonView(iconName: (showPortfolio ? "chevron.left" : "chevron.right"))
                        .onTapGesture {
                            showPortfolio.toggle()
                        }
                        
                }
                .padding(.horizontal)
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .toolbar(.hidden)
    }
}

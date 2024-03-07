//
//  HomeView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 80) {
                   HeaderButtonView(buttonImage: "info")
                    
                    Text(viewModel.headerText)
                        .bold()
                        .foregroundStyle(Color.theme.accentColor)
                    
                    HeaderButtonView(buttonImage: "chevron.right")
                }
                Spacer()
            }
        }
//        .onAppear(perform: {})
    }
}

#Preview {
    HomeView()
}

//
//  HomeView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

class HomeViewModel: ObservableObject { //TODO: Move it back to its folder
    
    @Published var headerText: String = "Live Prices"
    
}

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    //TODO: Add a property isPressed
    
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
                        .onTapGesture {
                            //TODO: toggle the isPressed
                            print("Pressed!")
                        }
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

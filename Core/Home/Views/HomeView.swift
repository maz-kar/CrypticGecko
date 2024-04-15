//
//  HomeView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

class HomeViewModel: ObservableObject { //TODO: Move it back to its folder
    
    //@Published var headerText: String = "" //TODO: CHECK
    
}

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    @State var chevronRightPressed: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 80) {
                    Button(action: {
                        
                    }, label: {
                        HeaderButtonView(buttonImage: chevronRightPressed ? "plus" : "info")
                    })
                    
                    Text(chevronRightPressed ? "Portfolio" : "Live Prices")
                        .bold()
                        .foregroundStyle(Color.theme.accentColor)
                        .frame(width: 90)
                    
                    HeaderButtonView(buttonImage: chevronRightPressed ? "chevron.left" : "chevron.right")
                        .onTapGesture {
                            chevronRightPressed.toggle()
                        }
                }
                .padding()
                
                VStack {
                    HStack(spacing: 40) { //TODO: fix the space
                        Text("Market Cap")
                            .foregroundStyle(Color.theme.secondaryTextColor) //TODO: Refactor the repeated code
                            .font(.headline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text("24h Volume") //TODO: Put this in the middle, aligned with Live Prices
                            .foregroundStyle(Color.theme.secondaryTextColor)
                            .font(.headline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text("BTC Dominance") //TODO: instead of BTC must be dynamic
                            .foregroundStyle(Color.theme.secondaryTextColor)
                            .font(.headline)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                }
                VStack {
                    HStack(spacing: 70) { //TODO: fix the space
                        //TODO: Fix the position of the text, to start from left
                        Text("$1.35Tr")
                            .foregroundStyle(Color.theme.accentColor) //TODO: Refactor the repeated code
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                        Text("$262.24Bn") //TODO: Put this in the middle, aligned with Live Prices
                            .foregroundStyle(Color.theme.accentColor)
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("45.21%") //TODO: instead of BTC must be dynamic
                            .foregroundStyle(Color.theme.accentColor)
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }
                VStack {
                    HStack(spacing: 70) {
                        Text("-16.08%") //TODO: Add arrow down/up symbol
                        //TODO: shift the text to the left
                        
                            .foregroundStyle(Color.theme.redColor)
                            .font(.footnote)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                }
                
                VStack {
                    
                }
                
                Spacer()
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

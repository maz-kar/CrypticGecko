//
//  HomeView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

class HomeViewModel: ObservableObject { //TODO: Move it back to its folder
    
    @Published var headerText: String = ""
    
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
                Spacer()
            }
        }
//        .onAppear(perform: {})
    }
}

#Preview {
    HomeView()
}

/*
TODO:
when pressing chevron.right:
try to use manuel set up instead of chevron.left
add an animation when chevronRight is pressed for the info button when it becomes plus
 
DONE:
 */

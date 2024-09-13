//
//  LaunchView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.09.24.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: String = "Loading your portfolio..."
    @State private var showLaunchView: Bool = false
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLaunchView {
                    Text(loadingText)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.launch.accent)
                        .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLaunchView.toggle()
        }
    }
}

#Preview {
    LaunchView()
}

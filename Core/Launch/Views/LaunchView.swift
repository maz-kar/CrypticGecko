//
//  LaunchView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.09.24.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading your portfolio...".map({ String($0) }) //maps a single String to an array of Strings
    @State private var showLaunchView: Bool = false
    @State private var counter: Int = 0 //Every time that counter updates, SwiftUI will rerun the whole view, including the ForEach
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLaunchView {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.launch.accent)
                                .offset(y: counter == index ? -5 : 0) // -5 means that letter to go UP if counter == index
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLaunchView.toggle()
        }
        .onReceive(timer, perform: { _ in //every 0.1 sec the timer will be executed and this closure will run
            withAnimation(.spring) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex { //when we reach to last index, reset the counter
                    counter = 0
                } else {
                    counter += 1
                }
            }
        })
    }
}

#Preview {
    LaunchView()
}

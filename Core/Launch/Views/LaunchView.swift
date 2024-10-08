//
//  LaunchView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.09.24.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading your portfolio...".map({ String($0) }) //maps a single String to an array of Strings
    @State private var showLoadingText: Bool = false
    @State private var counter: Int = 0 //Every time that counter updates, SwiftUI will rerun the whole view, including the ForEach
    @State private var loops: Int = 0
    
    @Binding var showLaunchView: Bool
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(0..<loadingText.count, id: \.self) { index in
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
            showLoadingText.toggle()
        }
        //Here we receive the value of the timer publisher
        .onReceive(timer, perform: { _ in //every 0.1 sec the timer will be executed and this closure will run
            withAnimation(.spring) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex { //when we reach to last index, reset the counter
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}

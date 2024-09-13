//
//  CrypticGeckoApp.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 06.02.24.
//

import SwiftUI

@main
struct CrypticGeckoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack {
                    HomeView()
                        .toolbar(.hidden)
                }
                .navigationViewStyle(StackNavigationViewStyle()) //fixes the iPad issue with detailsView
                .environmentObject(vm)
                
                ZStack { //This ZStack is always on top of the NavigationStack
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading)) //When we want to hide the launchScreen we do a transition to left, instead of going and hide behind the navigation
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}

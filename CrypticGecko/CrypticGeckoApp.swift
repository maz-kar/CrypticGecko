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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Test()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}

//
//  SettingsView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.09.24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    let linkedInURL = URL(string: "https://www.linkedin.com/in/maz-kar-80555b148/")!
    let githubURL = URL(string: "https://github.com/maz-kar")!
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    let defaultURL = URL(string: "https://www.google.com")!
    
    var body: some View {
        //As it will be a sheet and it will create a new environment, we will not be in our navigationView anymore, we need to add a new NavigationStack
        NavigationStack {
            ZStack {
                //background
                Color.theme.background
                    .ignoresSafeArea()
                
                //content
                List {
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .tint(.blue)
            .font(.headline)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    })
                }
            }
        }
    }
}

extension SettingsView {
    private var developerSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app uses MVVM architecture, Combine and CoreData. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
            HStack {
                Link("Visit LinkedIn 💻", destination: linkedInURL)
                Spacer()
                Link("Visit Github 🧑🏻‍💻", destination: githubURL)
            }
            
        } header: {
            Text("Developer")
        }
    }
    
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed. ")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Visit CoinGecko 🦎", destination: coinGeckoURL)
            
        } header: {
            Text("CoinGecko")
        }
    }
    
    private var applicationSection: some View {
        Section {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        } header: {
            Text("Application")
        }
    }
}

#Preview {
    SettingsView()
}

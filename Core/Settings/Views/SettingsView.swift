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
    
    var body: some View {
        //As it will be a sheet and it will create a new environment, we will not be in our navigationView anymore, we need to add a new NavigationStack
        NavigationStack {
            List {
                developerSection
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
                
                Text("This app uses MVVM architecture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("LinkedIn 💻", destination: linkedInURL)
            Link("Github 🧑🏻‍💻", destination: githubURL)

        } header: {
            Text("Developer")
        }
    }
    
}

#Preview {
    SettingsView()
}

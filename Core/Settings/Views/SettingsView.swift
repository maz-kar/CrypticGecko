//
//  SettingsView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.09.24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        //As it will be a sheet and it will create a new environment, we will not be in our navigationView anymore, we need to add a new NavigationStack
        NavigationStack {
            List {
                Text("Hi")
            }
            .listStyle(.plain)
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

#Preview {
    SettingsView()
}

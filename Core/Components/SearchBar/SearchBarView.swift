//
//  SearchBarView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 31.05.24.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? Color.theme.secondaryTextColor : Color.theme.accentColor)
            
            TextField("Search by name or symbol", text: $searchText)
                .foregroundStyle(Color.theme.accentColor)
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.theme.backgroundColor)
                .shadow(
                    color: Color.theme.accentColor.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView()
}




//
//  SearchBarViewTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 20.08.24.
//

import SwiftUI

struct SearchBarViewTest: View {
    @State var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? Color.theme.secondaryTextColor : Color.theme.accentColor)
            TextField("Search by name or symbol", text: $searchText)
                .disableAutocorrection(true)
        
        }
        .font(.headline)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.theme.backgroundColor)
                .shadow(color: Color.theme.accentColor, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0).opacity(0.2)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .padding() //extra padding added in order convenience for user to tap
                        .foregroundStyle(Color.theme.secondaryTextColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            
                        }
                        
                }
        }
        .padding()
    }
}

#Preview {
    SearchBarViewTest()
}

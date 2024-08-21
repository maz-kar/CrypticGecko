//
//  SearchBarView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 31.05.24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String //Every time we have SearchBarView, we need to bind to a searchText
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? Color.theme.secondaryTextColor : Color.theme.accentColor)
            
            TextField("Search by name or symbol", text: $searchText)
                .foregroundStyle(Color.theme.accentColor)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.theme.accentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            //shared is the singleton instance of UIApplication
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                }
                .disableAutocorrection(true)
        }
        .font(.headline)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.theme.backgroundColor)
                .shadow(color: Color.theme.accentColor.opacity(0.3),
                        radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
        }
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}




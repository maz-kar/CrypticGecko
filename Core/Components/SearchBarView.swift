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
                .foregroundStyle(searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent)
            
            TextField("Search by name or symbol", text: $searchText)
                .foregroundStyle(Color.theme.accent)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            //shared is the singleton instance of UIApplication
                            UIApplication.shared.endEditing()
                            searchText = ""
                            //Ideally it could be perfect if we could hide portfoliInputSection
                        }
                }
                .disableAutocorrection(true)
        }
        .font(.headline)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.3),
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




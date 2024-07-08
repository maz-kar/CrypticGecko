//
//  SearchFieldView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 04.07.24.
//

import SwiftUI

struct SearchFieldViewTest: View {
    @State var searchText: String = ""
    
    var body: some View {
        HStack() {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? Color.gray : Color.black)
            
            TextField("Search by name or symbol", text: $searchText)
                .font(.headline)
            
            if !searchText.isEmpty {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        self.searchText = ""
                    }
            }
            
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color.white)
                .shadow(color: .gray, radius: 5)
        }
        .padding()
    }
}

#Preview {
    SearchFieldViewTest()
}

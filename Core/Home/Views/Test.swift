//
//  Test.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 03.07.24.
//

import SwiftUI

struct Test: View {
    @State private var showPortfol = false
    
    var body: some View {
        TestHeader
        
        SearchFieldView()
        
        Spacer()
        
    }
}

#Preview {
    Test()
}

extension Test {
    private var TestHeader: some View {
        HStack {
            CircleBtnView(sfImage: showPortfol ? "plus" : "info")
            
            Spacer()
            
            Text(showPortfol ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            
            CircleBtnView(sfImage: showPortfol ? "chevron.left" : "chevron.right")
                .onTapGesture {
                    showPortfol.toggle()
                    print(showPortfol)
                }
        }
        .padding()
    }
}

//TODO: make a separate component out of it
struct CircleBtnView: View {
    
    var sfImage: String
    
    var body: some View {
        Circle()
            .foregroundStyle(Color.white)
            .frame(width: 50, height: 50)
            .shadow(color: .gray, radius: 5)
            .overlay {
                Image(systemName: sfImage)
                    .fontWeight(.bold)
            }
        
    }
}

struct SearchFieldView: View {
    @State var searchText: String = ""
    
    var body: some View {
        HStack() {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.gray)
            
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



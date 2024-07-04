//
//  Test.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 03.07.24.
//

import SwiftUI

struct TestView: View {
    @State private var showPortfol = false
    
    var body: some View {
        
        VStack {
            Header
            SearchFieldView()
            ColumnTitles
            CoinRowView()
        }
        Spacer()
    }
}

#Preview {
    TestView()
}

extension TestView {
    private var Header: some View {
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
    
    private var ColumnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            Text(showPortfol ? "Holdings" : "")
            Spacer()
            Text("Price")
        }
        .font(.footnote)
        .foregroundStyle(Color.gray)
        .padding()
    }
}

/*
 //add transition to the showPortfolio on mode
 //Download and show coins on TestView
 
 */



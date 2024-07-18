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
            header
            
            SearchFieldViewTest()
            
            columnTitles
            
            CoinRowViewTest()
        }
        Spacer()
    }
}

#Preview {
    TestView()
}

extension TestView {
    private var header: some View {
        HStack {
            CircleBtnViewTest(sfImage: showPortfol ? "plus" : "info")
            
            Spacer()
            
            Text(showPortfol ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            
            CircleBtnViewTest(sfImage: showPortfol ? "chevron.left" : "chevron.right")
                .onTapGesture {
                    showPortfol.toggle()
                    print(showPortfol)
                }
        }
        .padding()
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            Text("Price")
        }
        .font(.footnote)
        .foregroundStyle(Color.gray)
        .padding()
    }
    
}



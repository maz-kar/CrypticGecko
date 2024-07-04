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
            TestHeader
            SearchFieldView()
            TestColumnTitles
            CoinListView()
        }
        Spacer()
    }
}

#Preview {
    TestView()
}

extension TestView {
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
    
    private var TestColumnTitles: some View {
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

//TODO: make a separate component out of it
struct CoinListView: View {
    @State var percent: Double = -5.7
    @State var holdingShares: Double = 1.50
    
    var body: some View {
        List {
            ForEach(0..<10) { _ in
                HStack {
                    Text("1")
                        .foregroundStyle(Color.gray)
                    Circle()
                        .frame(width: 30, height: 30)
                    Text("BTC")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("85.500 $")
                            .fontWeight(.bold)
                        Text(String(format: "%.2f", holdingShares))
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("57.000 $")
                            .fontWeight(.bold)
                        Text(String(format: "%.2f", percent) + "%")
                            .font(.footnote)
                            .foregroundStyle(percent < 0.0 ? Color.red : Color.green)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

/*
 //add transition to the showPortfolio on mode
 
 
 */



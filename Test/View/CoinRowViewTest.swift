//
//  CoinRowView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 04.07.24.
//

import SwiftUI

struct CoinRowViewTest: View {
    @State var percent: Double = -5.7
    @State var holdingShares: Double = 1.50
    
    var body: some View {
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

#Preview {
    CoinRowViewTest()
}

//
//  CoinsRowView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 08.04.24.
//

import SwiftUI

struct CoinsRowView: View {
    let coin: CoinsModel
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accentColor)
            Spacer() //TODO: CHECK
            
            VStack(alignment: .trailing) { //TODO: CHECK
                Text(coin.currentPrice.asCurrencyWith6Decimals()) //TODO: How to move $ to left and without space?
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .foregroundStyle((coin.priceChangePercentage24H ?? 0 >= 0) ? Color.theme.greenColor : Color.theme.redColor)
            }
        }
    }
}

struct CoinsRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsRowView(coin: dev.coin)
    }
}

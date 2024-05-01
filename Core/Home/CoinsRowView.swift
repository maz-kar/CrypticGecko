//
//  CoinsRowView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 08.04.24.
//

import SwiftUI

struct CoinsRowView: View {
    let coin: CoinsModel
    var showHoldingsColumn: Bool
    
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
            Spacer()
            if showHoldingsColumn {
                VStack(alignment: .trailing) {
                    Text("\(coin.currentHoldingsValue.asCurrencyWith2Decimals())")
                        .bold()
                    Text("\((coin.currentHoldings ?? 0).asNumberString())")
                }
                .foregroundStyle(Color.theme.accentColor)
            }
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundStyle(Color.theme.accentColor)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .foregroundStyle((coin.priceChangePercentage24H ?? 0 >= 0) ? Color.theme.greenColor : Color.theme.redColor)
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.subheadline)
    }
}

struct CoinsRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsRowView(coin: dev.coin, showHoldingsColumn: true)
    }
}

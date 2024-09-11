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
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn {
                middleColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
        .background( //Good practice to make all of the row clickable.
            Color.theme.backgroundColor
        )
    }
}

struct CoinsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinsRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            CoinsRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinsRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
            
            CoinImageView(coin: coin)
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accentColor)
        }
    }
    
    private var middleColumn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentHoldingsValue.asCurrencyWith2Decimals())")
                .bold()
            Text("\((coin.currentHoldings ?? 0).asNumberString())")
        }
        .foregroundStyle(Color.theme.accentColor)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accentColor)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle((coin.priceChangePercentage24H ?? 0 >= 0) ? Color.theme.greenColor : Color.theme.redColor)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}

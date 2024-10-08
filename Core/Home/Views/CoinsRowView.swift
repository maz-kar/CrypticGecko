//
//  CoinsRowView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 08.04.24.
//

import SwiftUI

struct CoinsRowView: View {
    let coin: CoinModel
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
            Color.theme.background
        )
    }
}

extension CoinsRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            CoinImageView(coin: coin)
                .frame(width: 25, height: 25)
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var middleColumn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentHoldingsValue.asCurrencyWith2Decimals())")
                .bold()
            Text("\((coin.currentHoldings ?? 0).asNumberString())")
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle((coin.priceChangePercentage24H ?? 0 >= 0) ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
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

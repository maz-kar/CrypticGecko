//
//  CoinImage.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.05.24.
//

import SwiftUI

struct CoinImageView: View {
    
    let coin: CoinsModel
    
    var body: some View {
        AsyncImage(url: URL(string: coin.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        } placeholder: {
            Circle()
                .foregroundStyle(Color.theme.accentColor)
        }
        .frame(width: 30, height: 30)
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinImageView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}

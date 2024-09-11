//
//  CoinImage.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.05.24.
//

import SwiftUI
import Combine

struct CoinImageView: View {
    
    @StateObject private var viewModel: CoinImageViewModel
    
    init(coin: CoinsModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
        }
        
        
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

//
//  CoinImageViewTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 19.08.24.
//

import SwiftUI

struct CoinImageViewTest: View {
    @StateObject private var vm: CoinImageViewModelTest
    
    init(coin: CoinsModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModelTest(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
            }
        }
    }
}

struct CoinImageViewTest_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinImageViewTest(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}

//
//  CoinsViewTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 11.07.24.
//

import SwiftUI

struct CoinsViewTest: View {
    @StateObject var vm = CoinsViewModelTest()
    var body: some View {
        
        List {
            ForEach(vm.coins) { coin in
                HStack(spacing: 30) {
                    Text(coin.marketCapRank.description)

                    AsyncImage(url: URL(string: coin.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .foregroundStyle(Color.gray)
                    }
                    .frame(width: 30, height: 30)
                    
                    Text(coin.symbol.uppercased())
                    
                    Text("\(coin.currentPrice)$")
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    CoinsViewTest()
}

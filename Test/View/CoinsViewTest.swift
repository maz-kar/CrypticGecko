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
                HStack {
                    Text(coin.marketCapRank.description)
                    Circle()
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

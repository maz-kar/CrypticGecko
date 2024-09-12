//
//  ChartView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 12.09.24.
//

import SwiftUI

struct ChartView: View {
    let data: [Double]
    
    init(coin: CoinModel) {
        self.data = coin.sparklineIn7D?.price ?? []
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChartView(coin: dev.coin)
        }
    }
}

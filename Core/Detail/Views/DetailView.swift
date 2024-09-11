//
//  DetailView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 09.09.24.
//

import SwiftUI

struct DetailView: View {
    @Binding var coin: CoinsModel?
    
    init(coin: Binding<CoinsModel?>) {
        self._coin = coin
        print("Initializing Detail View for \(coin.wrappedValue?.name)")
    }
    
    var body: some View {
        Text(coin?.name ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: .constant(dev.coin))
        }
    }
}

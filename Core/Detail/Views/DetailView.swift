//
//  DetailView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 09.09.24.
//

import SwiftUI

struct DetailLoadingView: View { //Good practice to not go with Binding tricks like the last commit
    @Binding var coin: CoinsModel?
    
    var body: some View {
        if let coin = coin {
            DetailView(coin: coin)
        }
    }
}

struct DetailView: View {
    let coin: CoinsModel //If not Binding, when selectedCoin changes, our DetailView will not be notified that it needs to change.
    
    init(coin: CoinsModel) {
        self.coin = coin
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

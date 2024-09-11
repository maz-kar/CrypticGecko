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
    @StateObject var vm: DetailViewModel //Good practice to deal with @StateObject var when the ViewModel needs a parameter in the time of being created.
    
    init(coin: CoinsModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        Text("Hello")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

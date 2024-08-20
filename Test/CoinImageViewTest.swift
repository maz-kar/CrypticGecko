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

/*
 Networking layers of getting the images can be started from here:
 - we suppose to get the image and then call this CoinImageView in our CoinsRowView.
 - if image coming from CoinImageViewModel exists, we show it in the view.
 - if not and isLoading is true, we show a progessView. This isLoading can be true only throughout the init method, when getImage method is not done with getting the published subscription from the Service.
 - if non of the cases is true, we show a question mark.
 - the ? case is very improbable as isLoading will be false inside of getImage and its sink's completion and the only step remaining is receving data.
 - The trick here is the way that we initialize the @StateObject viewModel inside of init method.
 */

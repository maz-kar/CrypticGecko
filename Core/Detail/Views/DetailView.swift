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
        NavigationView {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel //Good practice to deal with @StateObject var when the ViewModel needs a parameter in the time of being created.
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let spacing: CGFloat = 30
    
    
    init(coin: CoinsModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("")
                    .frame(height: 150)
                overviewTitle
                Divider()
                overviewGrid
                additionalTitle
                Divider()
                additionGrid
            }
            .padding()
            .navigationTitle(vm.coin.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView {
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .foregroundStyle(Color.theme.accentColor)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .foregroundStyle(Color.theme.accentColor)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
            ForEach(vm.overviewStatistics) { stat in //For our data, we need the array of statistic model that we can loop on that we can throw them all in the statistic view.
                StatisticView(stat: stat)
            }
        })
    }
    
    private var additionGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
            ForEach(vm.additionalStatistics) { stat in
                StatisticView(stat: stat)
            }
        })
    }
    
}

//
//  HomeStatsView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 22.08.24.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { statistic in
                StatisticView(stat: statistic)
                //To divide the screen to desire number, we can use UIScreen...
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}

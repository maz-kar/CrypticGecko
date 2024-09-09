//
//  HomeView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    /*
                     Our HomeView has the environment of HomeViewModel.
                     But the .sheet's content is PortfolioView which is total new envorinment.
                     If we want the environment object in our portfolio, we need to add it manually to environment of the PortfolioView
                     */
                    PortfolioView()
                        .environment(vm)
                })
            VStack {
                homeHeader
                
                HomeStatsView(showPortfolio: $showPortfolio)
                
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }

                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack() {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
                .animation(.none, value: showPortfolio)
                .background {
                    CircleButtonAnimationView(animate: $showPortfolio)
                }
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none, value: showPortfolio)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accentColor)
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(.degrees(showPortfolio ? 180 : 0), anchor: .center)
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinsRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
        .refreshable { vm.reloadData() }
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinsRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity(vm.sortOption == .rank || vm.sortOption == .rankReversed ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            
            Spacer()
            
            if showPortfolio {
                HStack(spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity(vm.sortOption == .holding || vm.sortOption == .holdingReversed ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holding ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation {
                        vm.sortOption = vm.sortOption == .holding ? .holdingReversed : .holding
                    }
                }
            }
            HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity(vm.sortOption == .price || vm.sortOption == .priceReversed ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            .onTapGesture {
                withAnimation {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
        }
        .padding(.horizontal)
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryTextColor)
    }
}

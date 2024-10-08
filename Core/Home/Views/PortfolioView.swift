//
//  PortfolioView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 25.08.24.
//

import SwiftUI

struct PortfolioView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil { //Good practice to hide a view. If not yet selected, the view will not be shown
                        portfolioInputSection
                    }
                }
                //To defuse the automatic default dark mode which is taking over our background color.
                .background {
                    Color.theme.background
                        .ignoresSafeArea()
                }
            }
            //Good practice for navigation elements from Title to Item, dismiss etc.
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    xMarkButton
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            })
            .onChange(of: vm.searchText) { //watches any value in our app, and if it changes, we can run a func.
                if vm.searchText == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}

extension PortfolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: 10) {
                //if searchField is empty, just show the purchased coins, if not, show allCoins BUT remember allCoins is the filtered one through searching process
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) { //Good practice of giving an animation vibe when clicking on
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background( //This is the background of the frame of each coin
                            RoundedRectangle(cornerRadius: 10)
                            //IMPORTANT: it wont work with selectedCoin == coin. Using .id will make both sides equatable
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear
                                        , lineWidth: 1.0) //This stroke has content and lineWidth.
                        )
                }
            }
            .frame(height: 120) //Good practice for an optimum frame. There is a gap between CoinLogoView and the parent LazyHStack, that's why we are not using both height or width with one frame
            .padding(.leading)
        })
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        //Checks if coin exists in portfolio list
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)" //if so, amount of this existing coin is its currentHolding
        } else {
            quantityText = "" //if not, we should see empty textField
        }
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View {
        VStack {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text("\(selectedCoin?.currentPrice.asCurrencyWith2Decimals() ?? "")")
            }
            Divider()
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing) //To move the placeholder on textField
                    .keyboardType(.decimalPad) //To popup only numberPad on virtual keyboard
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text("\(getCurrentValue().asCurrencyWith2Decimals())")
            }
        }
        .animation(.none, value: UUID()) //The new animation requires _value to toggle the animation but as we were looking for .none which should be applied in ANY case, we put random value using UUID()
        .padding()
        .font(.headline)
    }
    
    private var xMarkButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
    
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            Button(action: {
                saveButtonPressed()
            }, label: {
                Text("Save".uppercased())
            })
            .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0 : 0.0) //show the SAVE button if... could also simply be && quantityText != ""
        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin,
              let amount = Double(quantityText)
        else { return }
        
        vm.updatePortfolio(coin: coin, amount: amount)
        
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        UIApplication.shared.endEditing() //Dismisses the virtual keyboard when save was pressed.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil //if selectedCoin is nil, portfoliInputSection will be disappeared
        vm.searchText = ""
    }
    
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}

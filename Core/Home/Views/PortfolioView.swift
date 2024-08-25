//
//  PortfolioView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 25.08.24.
//

import SwiftUI

struct PortfolioView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    Text("Hi")
                }
            }
            .navigationTitle("Edit Portfolio")
        }
    }
}

#Preview {
    PortfolioView()
}

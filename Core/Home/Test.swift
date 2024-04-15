//
//  Test.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 15.04.24.
//

import SwiftUI

struct Test: View {
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Header")
            }
        }
    }
}

#Preview {
    Test()
}

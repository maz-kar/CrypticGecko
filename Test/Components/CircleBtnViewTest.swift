//
//  CircleBtnView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 04.07.24.
//

import SwiftUI

struct CircleBtnViewTest: View {
    var sfImage: String
    
    var body: some View {
        Circle()
            .foregroundStyle(Color.white)
            .frame(width: 50, height: 50)
            .shadow(color: .gray, radius: 5)
            .overlay {
                Image(systemName: sfImage)
                    .fontWeight(.bold)
            }
    }
}

#Preview {
    Group {
        CircleBtnViewTest(sfImage: "info")
            .padding()
        CircleBtnViewTest(sfImage: "chevron.right")
    }
    
}

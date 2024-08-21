//
//  CircleButtonAnimationView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 22.04.24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .opacity(animate ? 0.0 : 1.0)
            .scaleEffect(animate ? 1.0 : 0.0)
            .animation(animate ? .easeOut(duration: 2.0) : .none , value: animate)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100, height: 100)
}

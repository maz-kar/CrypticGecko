//
//  StatisticView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 21.08.24.
//

import SwiftUI

struct StatisticView: View {
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
            
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accentColor)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.footnote)
                    .rotationEffect(.degrees((stat.precentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.precentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.precentageChange ?? 0) >= 0 ? Color.theme.greenColor : Color.theme.redColor)
            //To keep the height of the frame constant, we make opacity 0, if there is no percentage
            .opacity((stat.precentageChange == nil) ? 0.0 : 1.0)
        }
    }
}


struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            StatisticView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            StatisticView(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            StatisticView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

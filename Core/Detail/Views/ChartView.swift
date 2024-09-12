//
//  ChartView.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 12.09.24.
//

import SwiftUI

struct ChartView: View {
    let data: [Double]
    let minY: Double
    let maxY: Double
    let lineColor: Color
    
    init(coin: CoinModel) {
        self.data = coin.sparklineIn7D?.price ?? []
        self.minY = data.min() ?? 0
        self.maxY = data.max() ?? 0
        
        //To check if the graph is a + or -
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        self.lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
    }
    
    var body: some View {
        chartView
            .frame(height: 200)
            .background(
                VStack {
                    Divider()
                    Spacer()
                    Divider()
                    Spacer()
                    Divider()
                }
            )
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChartView(coin: dev.coin)
            //.frame(width: 200)
        }
    }
}

extension ChartView {
    private var chartView: some View {
        GeometryReader { geometry in
            VStack() {
                Path { path in
                    //loop through the index of coins
                    for index in data.indices {
                        /*
                         if full width = 300
                         if data.count = 100 --> 300/100 = 3
                         0+1 * 3 = 3
                         99+1 * 3 = 300
                         so our x will go all the way from 3 to 300
                         */
                        let xPosition = (geometry.size.width / CGFloat(data.count)) * CGFloat(index + 1)
                        
                        let yAxis = maxY - minY
                        let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                        
                        
                        //if we are in the 1st loop, let's move the pointer to where we want to start
                        if index == 0 {
                            path.move(to: CGPoint(x: xPosition, y: yPosition)) //starting point is now the first x and y position
                        }
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
                .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            }
        }
    }
}

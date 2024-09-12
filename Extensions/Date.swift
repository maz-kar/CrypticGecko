//
//  Date.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 12.09.24.
//

import Foundation

extension Date {
    
    //"2013-07-06T00:00:00.000Z"
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortformatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortformatter.string(from: self)
    }
    
}

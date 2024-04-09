//
//  Double.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 08.04.24.
//

import Foundation

extension Double {
    
    ///Converts a Double into a Currency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    ///```
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        formatter.usesGroupingSeparator = true
        formatter.locale = .current
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.currencyCode = "usd"
        
        return formatter
    }
    
    ///Converts a Double into a Currency as a String with 2-6 decimal places
    ///```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
}

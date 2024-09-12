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
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" //Here I give the format of my received date from API to the receiver (formatter)
        let date = formatter.date(from: coinGeckoString) ?? Date() //Gets String, returns Date (with the format that we gave above). "yyyy-MM-dd'T'HH:mm:ss.SSSZ" will be 2024-09-12 13:37:53 +0000
        self.init(timeInterval: 0, since: date) //It creates a Date object from date. if we want 7 days before we could write timeInterval: -7*24*60*60. But we don't as this is our current date
    }
    
    private var shortformatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String { //Converts the shortStyle Date to String
        return shortformatter.string(from: self)
    }
    
}

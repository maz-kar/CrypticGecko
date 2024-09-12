//
//  String.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 12.09.24.
//

import Foundation

extension String {
    
    var removingHTMLOccurance: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

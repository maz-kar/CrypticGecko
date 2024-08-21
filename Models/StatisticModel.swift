//
//  StatisticModel.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 21.08.24.
//

import Foundation

struct StatisticModel: Identifiable, Codable {
    //To use a model in a Foreach loop, we need to conform to Identifiable and after that we need to have a var id
    var id = UUID().uuidString
    let title: String
    let value: String
    let precentageChange: Double?
    
    init(title: String, value: String, precentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.precentageChange = precentageChange
    }
}




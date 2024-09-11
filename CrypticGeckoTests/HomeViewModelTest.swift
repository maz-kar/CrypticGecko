//
//  HomeViewModelTest.swift
//  CrypticGeckoTests
//
//  Created by Maziar Layeghkar on 09.09.24.
//

import XCTest
@testable import CrypticGecko

final class HomeViewModelTest: XCTestCase {
    
    private var sut: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        sut = HomeViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}

struct CoinsModel {
    let id: String
    let symbol: String
    let name: String
}

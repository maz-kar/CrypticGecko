//
//  UIApplication.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 21.08.24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    //Dismisses the keyboard when tapping on our xMark
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

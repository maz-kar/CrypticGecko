//
//  LocalFileManager.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 17.05.24.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    private init() { }
    
    func getImage() {
        
    }
    
    func saveImage(image: UIImage) {
        //image itself cannot be saved in fileManager but the data of that image
        guard 
            let data = image.pngData(),
            let url = URL(string: "")
            else { return }
        
        //To save this data
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image: \(error)")
        }
        
    }
    
}

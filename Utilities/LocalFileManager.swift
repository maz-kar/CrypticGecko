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
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        //image itself cannot be saved in fileManager but the data of that image
        guard 
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderName: folderName)
            else { return }
        
        //To save this data
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image: \(error)")
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        //We want to have access to fileManager
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {
            return nil
        }
        
        return url.appending(path: folderName) //returns: directory/foldername
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName)
        else {
            return nil
        }
        
        return folderURL.appending(path: imageName + ".png") //returns: directory/foldername/imageName
    }
    
}

//
//  LocalFileManager.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 27.05.24.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        
        guard
            let data = image.pngData(),
            let url = getURLForFolder(folderName: folderName)
        else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. \(error)")
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let folder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return folder.appendingPathComponent(folderName)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
    private func createFolderIfNeeded(folderName: String) {
        if !FileManager.default.fileExists(atPath: folderName) {
            
        }
    }
}

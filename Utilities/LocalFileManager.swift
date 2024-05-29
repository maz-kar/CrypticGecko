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
    
    //Saves the image and for that we need only the URL of the destination folder to be saved there
    func saveImage(image: UIImage, folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(),
              let url = getURLForFolder(folderName: folderName) else { return }
        do {
            try data.write(to: url)
        } catch let error {
            print("Error while saving image. \(error)")
        }
    }
    
    func getImage() { //TODO: retrieve the saved images
        
        
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLForImage(folderName: String, imageName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil }
        print("This is our ImageURL: \(folderURL.appendingPathComponent(imageName + ".png"))")
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: folderURL.path) {
            do {
                try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error while creating folder. \(error)")
            }
            
        }
    }
    
    
    
}

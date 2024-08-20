//
//  LocalFileManagerTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 20.08.24.
//

import Foundation
import SwiftUI

class LocalFileManagerTest {
    
    /*
     We need at least 2 public funcs: saveImage, getImage
     We need 3 other funcs: getImageURL, getFolderURL, createFolderIfNeeded
    */
    
    static let instance = LocalFileManagerTest() //This Singleton instance is the ONLY instance that we use for this manager in our entire app.
    private init() { } //Here we want to be sure that the initializer is private to this class.
    
    func saveImage(image: UIImage, folderName: String, imageName: String) { //Will save the downloaded image
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(),  //Image itself can't be saved into fileManager but we can save the DATA for the image.
              let url = getURLForImage(folderName: folderName, imageName: imageName) else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error while saving image. \(error)")
        }
    }
    
    func getImage(folderName: String, imageName: String) -> UIImage? { //Will get/retrieve the saved image.
        guard let url = getURLForImage(folderName: folderName, imageName: imageName) else { return nil }
        return UIImage(contentsOfFile: url.path) //Go to the url and get the content of the file and return it to the caller
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName) //it attaches folderName like ...\folderName
    }
    
    private func getURLForImage(folderName: String, imageName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil }
        return folderURL.appendingPathComponent(imageName + ".png") //it attaches imageName like ...\folderName\imageName
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

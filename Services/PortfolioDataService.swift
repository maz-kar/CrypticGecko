//
//  PortfolioDataService.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 05.09.24.
//

import Foundation
import CoreData

/*
 Steps:
 1. We need a container.
 2. Create the container in the init.
 3. Load the data from the container.
 4. Create fetch func.
 5. Define a savedEntities property with [PortfolioEntity]
 6. Set the savedEntities with fetched data
 7.
 */

class PortfolioDataService {
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading core data. \(error)")
            }
        }
        
        getPortfolio()
    }
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: "PortfolioEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching portfolio entities. \(error)")
        }
    }
    
    
    
    
    
    
    
    
}

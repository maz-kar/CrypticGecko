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
        
        fetch()
    }
    
    private func fetch() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: "PortfolioEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching portfolio entities. \(error)")
        }
    }
    
    private func add(coin: CoinsModel, amount: Double) {
        let newItem = PortfolioEntity(context: container.viewContext)
        newItem.coinID = coin.id
        newItem.amount = amount
        
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving portfolio entities. \(error)")
        }
    }
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func applyChanges() {
        save()
        fetch()
    }
    
}

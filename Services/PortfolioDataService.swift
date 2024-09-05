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
 7. Create add func. Here we set attributes of our data base with the data from HomeViewModel and amount that we are passing during the call of this func.
 8. Create delete func.
 9. Create update func. We need it for the cases that we want to change the amount of already existed entity.
 10. Create save func. After either of add, delete and update, we need to save the changed data in our data base.
 11. Create applyChanges func. To call both save and fetch, in order to save and reload the saveEntities. This func will be called inside of each one of add, delete, update funcs.
 12. Create a public func updatePortfolio which at the end will be called from outer classes like the ViewModel.
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
    
    //MARK: Public
    
    func updatePortfolio(coin: CoinsModel, amount: Double) {
        
    }
    
    //MARK: Private
    
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
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving portfolio entities. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        fetch()
    }
    
}

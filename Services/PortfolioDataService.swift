//
//  PortfolioDataService.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 05.09.24.
//

import Foundation
import CoreData

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
        self.fetch()
    }
    
    //MARK: Public
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        //Checks if coin is already in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            if amount > 0 { //if put any amount except 0, we want to update.
                update(entity: entity, amount: amount)
            } else { //if we put zero, we want to delete.
                delete(entity: entity)
            }
        } else { //if it is not already in Portfolio, we want to add.
            add(coin: coin, amount: amount)
        }
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
    
    private func add(coin: CoinModel, amount: Double) {
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

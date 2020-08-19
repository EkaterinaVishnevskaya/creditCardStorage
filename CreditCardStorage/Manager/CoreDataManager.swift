//
//  CoreDataManager.swift
//  CreditCardStorage
//
//  Created by Gregory Pinetree on 19.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import CoreData

final class CoreDataManager {
    
    // MARK: - Constants
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CreditCardStorage")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading store failed \(error)")
            }
        }
        return container
    }()
    
    private enum Keys {
        static let creditCard = "CreditCardEntity"
    }
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Credit card CRUD
    
    private func createCreditCardEntity(_ creditCard: CreditCard) {
        
        let newCreditCard = NSEntityDescription.insertNewObject(forEntityName: Keys.creditCard, into: context) as! CreditCardEntity
        
        newCreditCard.fullName = creditCard.fullName
        newCreditCard.phoneNumber = creditCard.phoneNumber
        newCreditCard.expirationDate = creditCard.expirationDate
        newCreditCard.cardNumber = creditCard.cardNumber
        newCreditCard.cardCVV = creditCard.cardCVV
        
        do {
            try context.save()
        } catch {
            print("Failed to create credit card: \(error)")
        }
    }
    
    private func retrieveCreditCardEntities() -> [CreditCard]? {
        
        let fetchRequest = NSFetchRequest<CreditCardEntity>(entityName: Keys.creditCard)
        do {
            let cards = try context.fetch(fetchRequest)
            
            var result: [CreditCard] = []
            for card in cards {
                guard let fullName = card.fullName,
                      let expirationDate = card.expirationDate else { return nil }
                let cardModel = CreditCard(phoneNumber: card.phoneNumber, fullName: fullName, expirationDate: expirationDate, cardNumber: card.cardNumber, cardCVV: card.cardCVV)
                result.append(cardModel)
            }
            return result
        } catch {
            print("Failed to get credit card: \(error)")
        }
        return nil
    }
    
    private func deleteCreditCardEntity(_ cardNumber: Int64, _ CVV: Int16) {
        
        let fetchRequest = NSFetchRequest<CreditCardEntity>(entityName: Keys.creditCard)
        fetchRequest.predicate = NSPredicate(format: "cardNumber == %@ && cardCVV == %@", cardNumber, CVV)
        do {
            if let card = try context.fetch(fetchRequest).first {
                context.delete(card)
                try context.save()
            }
        } catch {
            print("Failed to delete credit card: \(error)")
        }
    }
}

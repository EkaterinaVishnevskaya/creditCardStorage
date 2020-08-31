//
//  AddCreditCardPresenter.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 24.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import Foundation

final class AddCreditCardPresenter {
    
    weak var view: AddCreditCardViewInput?
    var interactor: AddCreditCardInteractorInput?
    var router: AddCreditCardRouterInput?
    private let validator: CardValidatorProtocol
    private let dataManager: CoreDataManagerInput
    
    init(validator: CardValidatorProtocol, dataManager: CoreDataManagerInput) {
        self.validator = validator
        self.dataManager = dataManager
    }

}

extension AddCreditCardPresenter: AddCreditCardViewOutput {
    func saveInfo(cardNumber: String?, dateExpiration: String?, CVC: String?, phoneNumber: String?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        guard let intCardNumber = Int64(cardNumber ?? ""), let expirationDate = dateFormatter.date(from: dateExpiration ?? ""), let cardCVC = Int16(CVC ?? ""), let intPhoneNumber = Int64(phoneNumber ?? "") else {
            return
        }
        let card = CreditCard(phoneNumber: intPhoneNumber, expirationDate: expirationDate, cardNumber: intCardNumber, cardCVV: cardCVC)
        dataManager.createCreditCardEntity(card)
    }
    
    func modifyCreditCardString(cardNumber: String) {
        if let cardType = validator.verify(cardNumber: cardNumber) {
             print(cardType)
        }
        let trimmedString = cardNumber.components(separatedBy: .whitespaces).joined()

        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""

        if(arrOfCharacters.count > 0) {
            for i in 0...arrOfCharacters.count-1 {
                modifiedCreditCardString.append(arrOfCharacters[i])
                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                    modifiedCreditCardString.append(" ")
                }
            }
        }
        view?.setModifiedText(text: modifiedCreditCardString)
    }
    
    
}

extension AddCreditCardPresenter: AddCreditCardInteractorOutput {
    
}

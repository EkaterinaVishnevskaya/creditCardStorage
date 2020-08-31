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
    private var validator: CardValidatorProtocol!
    
    init(validator: CardValidatorProtocol) {
        self.validator = validator
    }

}

extension AddCreditCardPresenter: AddCreditCardViewOutput {

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

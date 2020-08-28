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
    }
}

extension AddCreditCardPresenter: AddCreditCardInteractorOutput {
    
}

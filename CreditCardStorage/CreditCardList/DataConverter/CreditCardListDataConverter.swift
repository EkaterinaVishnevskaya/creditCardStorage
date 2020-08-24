//
//  CreditCardListDataConverter.swift
//  CreditCardStorage
//
//  Created by Егор on 24.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import Foundation

/* struct CreditCard {
    let phoneNumber: Int64
    let fullName: String
    let expirationDate: Date
    let cardNumber: Int64
    let cardCVV: Int16
}*/

protocol CreditCardDataConverterInput {
    func convert(models: [CreditCard]) -> CreditCardListViewModel
}

final class CreditCardListDataConverter: CreditCardDataConverterInput {
    func convert(models: [CreditCard]) -> CreditCardListViewModel{
        return CreditCardListViewModel.init(creditCards: models)
    }
}

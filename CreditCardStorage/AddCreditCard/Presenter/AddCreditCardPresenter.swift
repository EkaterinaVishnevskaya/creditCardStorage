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
}

extension AddCreditCardPresenter: AddCreditCardViewOutput {
    
}

extension AddCreditCardPresenter: AddCreditCardInteractorOutput {
    
}

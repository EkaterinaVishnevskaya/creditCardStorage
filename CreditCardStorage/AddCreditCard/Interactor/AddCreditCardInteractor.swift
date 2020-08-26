//
//  AddCreditCardInteractor.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 24.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import Foundation

protocol AddCreditCardInteractorInput {
    
}

protocol AddCreditCardInteractorOutput: AnyObject {
    
}

final class AddCreditCardInteractor {
    
    weak var presenter: AddCreditCardInteractorOutput?
}

extension AddCreditCardInteractor: AddCreditCardInteractorInput {
    
}

//
//  CreditCardListInteractor.swift
//  CreditCardStorage
//
//  Created by Nick Chekmazov on 19.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol InteractorCreditCardListInput {
    
}

protocol InteractorCreditCardListOutput: AnyObject {
    
}

final class CreditCardListInteractor {
    
    weak var presenter: InteractorCreditCardListOutput?

}

extension CreditCardListInteractor: InteractorCreditCardListInput {
    
}

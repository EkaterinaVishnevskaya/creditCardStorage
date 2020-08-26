//
//  AddCreditCardRouter.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 24.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol AddCreditCardRouterInput {
    
}

final class AddCreditCardRouter {
    
    private let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension AddCreditCardRouter: AddCreditCardRouterInput {
    
}

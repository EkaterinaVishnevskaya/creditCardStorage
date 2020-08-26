//
//  CreditCardListRouter.swift
//  CreditCardStorage
//
//  Created by Nick Chekmazov on 19.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol RouterCreditCardListInput {
    func navigateToAddCardScreen()
}

final class CreditCardListRouter {
    
    unowned let view: UIViewController

    init(view: UIViewController) {
        self.view = view
    }
}

extension CreditCardListRouter: RouterCreditCardListInput {
    func navigateToAddCardScreen() {
        view.navigationController?.pushViewController(AddCreditCardAssembly.assembly(),
                                                      animated: true)
    }
}

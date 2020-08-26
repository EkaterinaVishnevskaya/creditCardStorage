//
//  AddCreditCardAssembly.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 24.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

final class AddCreditCardAssembly {
    
    static func assembly() -> UIViewController {
        let view = AddCreditCardViewController()
        let presenter = AddCreditCardPresenter()
        let interactor = AddCreditCardInteractor()
        let router = AddCreditCardRouter(view: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

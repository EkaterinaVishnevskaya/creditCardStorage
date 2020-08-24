//
//  AssemblyCreditCardList.swift
//  CreditCardStorage
//
//  Created by Nick Chekmazov on 19.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

final class AssemblyCreditCardList {
    
    static func assembly() -> UIViewController {
        let view = CreditCardListView()
        let dataConverter = CreditCardListDataConverter()
        let presenter = CreditCardListPresenter(dataConverter: dataConverter)
        let interactor = CreditCardListInteractor()
        let router = CreditCardListRouter(view: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
}

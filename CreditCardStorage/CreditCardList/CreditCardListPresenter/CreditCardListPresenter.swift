//
//  CreditCardListPresenter.swift
//  CreditCardStorage
//
//  Created by Nick Chekmazov on 19.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

final class CreditCardListPresenter {
    
    weak var view: ViewCreditCardListInput?
    var interactor: InteractorCreditCardListInput?
    var router: RouterCreditCardListInput?
    private let dataConverter: CreditCardDataConverterInput
    private let dataManager: CoreDataManagerInput
    init(dataConverter: CreditCardDataConverterInput, dataManager: CoreDataManagerInput) {
        self.dataConverter = dataConverter
        self.dataManager = dataManager
    }
}

extension CreditCardListPresenter: ViewCreditCardListOutput {
    
    func addCardClicked() {
        router?.navigateToAddCardScreen()
    }
    
    func viewIsReady() {
        let creditCardListViewModel = CreditCardListViewModel(creditCards: dataManager.retrieveCreditCardEntities() ?? [])
    }
    
    
}

extension CreditCardListPresenter: InteractorCreditCardListOutput {
    
}



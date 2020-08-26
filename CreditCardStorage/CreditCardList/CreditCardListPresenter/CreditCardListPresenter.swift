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
    init(dataConverter: CreditCardDataConverterInput) {
        self.dataConverter = dataConverter
    }
}

extension CreditCardListPresenter: ViewCreditCardListOutput {
    
    func addCardClicked() {
        router?.navigateToAddCardScreen()
    }
    
    func viewIsReady() {
        
    }
    
    
}

extension CreditCardListPresenter: InteractorCreditCardListOutput {
    
}



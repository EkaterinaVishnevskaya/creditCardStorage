//
//  ViewCreditCardList.swift
//  CreditCardStorage
//
//  Created by Nick Chekmazov on 19.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol ViewCreditCardListInput: AnyObject {
    
}

protocol ViewCreditCardListOutput {
    func viewIsReady()
}

final class CreditCardListView: UIViewController {

    var presenter: ViewCreditCardListOutput?
}

extension CreditCardListView: ViewCreditCardListInput {
    
}

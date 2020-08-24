//
//  AddCreditCardViewController.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 24.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol AddCreditCardViewOutput {
    
}

protocol AddCreditCardViewInput: AnyObject {
    
}

final class AddCreditCardViewController: UIViewController {

    var presenter: AddCreditCardViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension AddCreditCardViewController: AddCreditCardViewInput {
    
}

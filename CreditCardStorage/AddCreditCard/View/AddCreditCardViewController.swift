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
    private let textField = TitledTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        view.backgroundColor = .white
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.viewModel = TitledTextFieldViewModel(titleText: "blabla",
                                                       textFieldPlaceholderText: "ablabla",
                                                       keyboardType: UIKeyboardType.default,
                                                       isSecure: true)
    }
    
    @objc func rotated() {
//        view.layoutIfNeeded()
//        view.setNeedsLayout()
        textField.layoutIfNeeded()
        textField.setNeedsLayout()
    }
}

extension AddCreditCardViewController: AddCreditCardViewInput {
    
}

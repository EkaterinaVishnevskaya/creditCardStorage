//
//  AddCreditCardViewController.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 24.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol AddCreditCardViewOutput {
    func modifyCreditCardString(cardNumber: String)
}

protocol AddCreditCardViewInput: AnyObject {
    func setModifiedText(text: String)
}

final class AddCreditCardViewController: UIViewController {
    
    
    // MARK: - Constants
    
    private enum Constants {
        static let navigationViewHeight: CGFloat = 135
    }
    
    
    // MARK: - Public properties
    
    var presenter: AddCreditCardViewOutput?
    
    
    // MARK: - Private properties
    
    private let cardNumberTextField = TitledTextField()
    private let dateExpirationTextField = TitledTextField()
    private let CVCTextField = TitledTextField()
    private let phoneNumberTextField = TitledTextField()
    private let navigationView = NavigationHeaderView()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setConstraintsForViews()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupTextFields()
        
    }
    
    @objc func rotated() {
        //        view.layoutIfNeeded()
        //        view.setNeedsLayout()
        cardNumberTextField.layoutIfNeeded()
        cardNumberTextField.setNeedsLayout()
    }
    
    
    // MARK: - Private methods
    
    private func setupViews() {
        [navigationView, cardNumberTextField, dateExpirationTextField, CVCTextField, phoneNumberTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        cardNumberTextField.delegate = self
    }
    
    private func setConstraintsForViews() {
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: Constants.navigationViewHeight),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            cardNumberTextField.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 35),
            cardNumberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            cardNumberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21),
            
            CVCTextField.topAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: 26),
            CVCTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21),
            
            dateExpirationTextField.topAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: 26),
            dateExpirationTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            dateExpirationTextField.trailingAnchor.constraint(equalTo: CVCTextField.leadingAnchor, constant: -16),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: dateExpirationTextField.bottomAnchor, constant: 26),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -21)
        ])
    }
    
    private func setupTextFields() {
        cardNumberTextField.viewModel = TitledTextFieldViewModel(titleText: "Номер карты",
                                                                 textFieldPlaceholderText: "Номер вашей карты",
                                                                 keyboardType: UIKeyboardType.default,
                                                                 isSecure: true, creditCardField: .cardNumber)
        dateExpirationTextField.viewModel = TitledTextFieldViewModel(titleText: "Срок действия",
                                                                     textFieldPlaceholderText: "--/--",
                                                                     keyboardType: .default,
                                                                     isSecure: false, creditCardField: .dateExpiration)
        CVCTextField.viewModel = TitledTextFieldViewModel(titleText: "CVC Код",
                                                          textFieldPlaceholderText: "Защитный код",
                                                          keyboardType: .numberPad,
                                                          isSecure: true, creditCardField: .CVCTextField)
        phoneNumberTextField.viewModel = TitledTextFieldViewModel(titleText: "Your phone #",
                                                                  textFieldPlaceholderText: "Enter you phone number",
                                                                  keyboardType: .phonePad,
                                                                  isSecure: false, creditCardField: .phoneNumber)
    }
    
}

extension AddCreditCardViewController: AddCreditCardViewInput {
    func setModifiedText(text: String) {
        
    }
}

extension AddCreditCardViewController: TitledTextFieldDelegate {
    func textFieldDidChanged(text: String) {
        presenter?.modifyCreditCardString(cardNumber: text)
    }
}

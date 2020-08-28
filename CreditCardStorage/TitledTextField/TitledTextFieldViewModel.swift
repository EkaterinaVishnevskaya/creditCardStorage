//
//  TitledTextFieldViewModel.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 26.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

struct TitledTextFieldViewModel {
    let titleText: String
    let textFieldPlaceholderText: String
    let keyboardType: UIKeyboardType
    let isSecure: Bool
    let creditCardField: CreditCardFieldType
}

enum CreditCardFieldType {
    
    case cardNumber
    case dateExpiration
    case CVCTextField
    case phoneNumber

}

//
//  CardValidator.swift
//  CreditCardStorage
//
//  Created by Kirill Selivanov on 28.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol CardValidatorProtocol {
    func verify(cardNumber: String) -> CreditCardType?
}

struct CardValidator: CardValidatorProtocol {
    
    func verify(cardNumber: String) -> CreditCardType? {
        for creditCardType in CreditCardType.allCases {
            if test(cardType: creditCardType, cardNumber: cardNumber) {
                return creditCardType
            }
        }
        return nil
    }
    
    private func test(cardType: CreditCardType, cardNumber: String) -> Bool {

        do {
            
            let regex = try NSRegularExpression(pattern: cardType.pattern, options: .caseInsensitive)
            return regex.matches(in: cardNumber, options: [], range: NSMakeRange(0, cardNumber.count)).isEmpty == false

        } catch {

            return false
        }

    }
}

//
//  NibInitializable.swift
//  VK
//
//  Created by Anton Tolstov on 29.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

protocol NibInitializable {}

extension NibInitializable where Self: UIView {
    func className() -> String {
        let fullName: String = description
        let separators = CharacterSet(charactersIn: ".:")
        let parts = fullName.components(separatedBy: separators)
        guard let name = parts[safe: 1] else {
            fatalError("Fail of getting class name")
        }
        return name
    }
}

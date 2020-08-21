//
//  Array+.swift
//  VK
//
//  Created by Anton Tolstov on 29.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return (0..<count).contains(index) ? self[index] : nil
    }
}

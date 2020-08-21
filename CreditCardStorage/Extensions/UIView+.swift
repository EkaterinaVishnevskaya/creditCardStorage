//
//  UIView+.swift
//  VK
//
//  Created by Anton Tolstov on 29.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

extension UIView: NibInitializable {
    func loadNib() {
        Bundle.main.loadNibNamed(className(), owner: self, options: nil)
    }

    class func fromNib<T: UIView>() -> T {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? T else {
            fatalError("Fail init view from .xib")
        }
        return view
    }

    func dropShadow(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: -1, height: 1)
      layer.shadowRadius = 1

      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = radius

      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

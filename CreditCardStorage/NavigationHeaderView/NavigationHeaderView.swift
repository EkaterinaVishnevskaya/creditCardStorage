//
//  NavigationHeaderView.swift
//  VK
//
//  Created by Anton Tolstov on 29.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

final class NavigationHeaderView: UIView {
    

    // MARK: - Properties
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    // MARK: - Life Cycle
    
    private func loadView() {
        loadNib()
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
    }
    
}



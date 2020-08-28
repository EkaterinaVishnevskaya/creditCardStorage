//
//  TitledTextField.swift
//  CreditCardStorage
//
//  Created by Дмитрий Павлов on 26.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol TitledTextFieldDelegate: AnyObject {
    func textFieldDidChanged(text: String)
}

final class TitledTextField: UIView {
    
    //MARK: - Constants
    
    private enum Constants {
        static let titleFont = UIFont.systemFont(ofSize: 14)
        static let stackViewSpacing: CGFloat = 10
    }
    
    //MARK: - Properties
    
    private let titleLabel = UILabel()
    private let textField = UITextField()
    private let bottomLine = CALayer()
    weak var delegate: TitledTextFieldDelegate?
    
    var viewModel: TitledTextFieldViewModel? {
        didSet {
            if let viewModel = viewModel {
                updateView(with: viewModel)
            }
        }
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomLine.frame = CGRect(x: 0.0,
                                  y: textField.frame.height - 1,
                                  width: textField.frame.width,
                                  height: 1.0)
        //        bottomLine.layoutSublayers()
    }
    
    //MARK: - Private
    
    private func setupViews() {
        titleLabel.font = Constants.titleFont
        titleLabel.textColor = .blue
        
        textField.delegate = self
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        
        textField.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func updateView(with model: TitledTextFieldViewModel) {
        titleLabel.text = model.titleText
        textField.placeholder = model.textFieldPlaceholderText
        textField.keyboardType = model.keyboardType
        textField.isSecureTextEntry = model.isSecure
    }
    
    @objc private func didChangeText(textField: UITextField) {
        if let text = textField.text {
            delegate?.textFieldDidChanged(text: text)
        }
    }
}

//MARK: - UITextFieldDelegate
extension TitledTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomLine.backgroundColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomLine.backgroundColor = UIColor.gray.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch viewModel?.creditCardField {
        case .cardNumber:
            let newLength = (textField.text ?? "").count + string.count - range.length
            return newLength <= 19
        default:
            break
        }
        return true
        
    }
}

//

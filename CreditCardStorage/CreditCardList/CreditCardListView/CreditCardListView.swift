//
//  ViewCreditCardList.swift
//  CreditCardStorage
//
//  Created by Nick Chekmazov on 19.08.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit

protocol ViewCreditCardListInput: AnyObject {
    
}

protocol ViewCreditCardListOutput {
    func viewIsReady()
    func addCardClicked()
}

final class CreditCardListView: UIViewController {
    
    var presenter: ViewCreditCardListOutput?
    
    private enum Constants {
        static let cardCellIdentifier = "cardcell"
        static let addCardCellIdentifier = "addcardcell"
        static let navigationViewHeight: CGFloat = 135
        static let cellHeight: CGFloat = 55
    }
    
    private enum CardTableSections: Int {
        case card
        case addCard
    }
    
    override func viewDidLoad() {
    
        let navigationView = NavigationHeaderView()
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationView)
        
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: Constants.navigationViewHeight),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.cardCellIdentifier)
        tableView.register(UINib(nibName: "AddCardTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.addCardCellIdentifier)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension CreditCardListView: ViewCreditCardListInput {
    
}

extension CreditCardListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case CardTableSections.card.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: Constants.cardCellIdentifier) as! CardTableViewCell
        case CardTableSections.addCard.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: Constants.addCardCellIdentifier) as! AddCardTableViewCell
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case CardTableSections.card.rawValue:
            return "Существующие способы оплаты"
        case CardTableSections.addCard.rawValue:
            return "Добавить способ оплаты"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case CardTableSections.card.rawValue:
            // no-op
            break
        case CardTableSections.addCard.rawValue:
            presenter?.addCardClicked()
            break
        default:
            // no-op
            break
        }
    }
}


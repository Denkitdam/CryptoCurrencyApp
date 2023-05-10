//
//  CurrenciesListViewController.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 06.05.2023.
//

import UIKit

final class CoinsListViewController: UITableViewController {
    
    private var coins: [CryptoCurrency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrency()
    }
    
    private func fetchCurrency() {
        let url = URL(string: "https://api.coinstats.app/public/v1/coins")!
        NetworkManager.shared.fetchCoins(with: url) { [weak self] result in
            switch result {
            case .success(let coinList):
                self?.coins = coinList
            case .failure(let error):
                print(error)
            }
        }
    }
}

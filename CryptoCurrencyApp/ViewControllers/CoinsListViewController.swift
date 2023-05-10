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
        fetchCurrencies()
    }
    
    private func fetchCurrencies() {
        let url = URL(string: "https://api.coinstats.app/public/v1/coins")!
        NetworkManager.shared.fetchCoins(with: url) { [weak self] result in
            switch result {
            case .success(let coinList):
                self?.coins = coinList
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

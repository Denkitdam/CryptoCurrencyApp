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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let coinDetailsVC = segue.destination as? CoinDetailViewController else {
            return
        }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let coin = coins[indexPath.row]
        coinDetailsVC.coin = coin
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCurrency")
        guard let cell = cell as? CoinTableViewCell else { return UITableViewCell() }
        let coin = coins[indexPath.row]
        cell.configure(with: coin)
        
        
        
        return cell
    }
    
    private func fetchCurrencies() {
        let url = URL(string: "https://api.coinstats.app/public/v1/coins")!
        NetworkManager.shared.fetchCryptocurrency(from: url) { result in
            switch result {
            case .success(let currencies):
                print(currencies)
            case .failure(let error):
                print(error)
            }
        }
    }
}

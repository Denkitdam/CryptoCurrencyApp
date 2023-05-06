//
//  CurrenciesListViewController.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 06.05.2023.
//

import UIKit

class CurrenciesListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrency()
    }

    private func fetchCurrency() {
        let url = URL(string: "https://api.coinstats.app/public/v1/coins")!
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No Localised description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let cryptoCurrency = try decoder.decode([CryptoCurrency].self, from: data)
            } catch {
                print(error)
            }
        }.resume()
    }
}

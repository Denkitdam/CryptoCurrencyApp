//
//  ViewController.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 06.05.2023.
//

import UIKit

final class CoinDetailViewController: UIViewController {
    @IBOutlet var logoIcon: UIImageView!
    @IBOutlet var fullInfoLabel: UILabel!
    
    var coin: CryptoCurrency!
    private let neetworkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetails()
    }

    private func configureDetails() {
        fullInfoLabel.text = coin.fullInfo
        
        neetworkManager.fetchLogo(with: coin.icon) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.logoIcon.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }

}


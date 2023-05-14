//
//  CoinTableViewCell.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 10.05.2023.
//

import UIKit

final class CoinTableViewCell: UITableViewCell {
    @IBOutlet var coinIcon: UIImageView!
    @IBOutlet var shortInfo: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with cryptoCurrency: CryptoCurrency) {
        shortInfo.text = cryptoCurrency.shortDescription
        networkManager.fetchImageData(form: cryptoCurrency.icon) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.coinIcon.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

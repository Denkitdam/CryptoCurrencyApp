//
//  CoinTableViewCell.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 10.05.2023.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    @IBOutlet var coinIcon: UIImageView!
    @IBOutlet var fullInfo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

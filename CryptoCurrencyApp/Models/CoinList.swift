//
//  CryptoCurrency.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 06.05.2023.
//

import Foundation

struct CoinList: Decodable {
    let coins: [CryptoCurrency]
    
    init(coins: [CryptoCurrency]) {
        self.coins = coins
    }
    
    init(from value: [String: Any]) {
        coins = value["coins"] as? [CryptoCurrency] ?? []
    }
    
    static func getCoinList(From data: Any) -> CoinList {
        guard let coinData = data as? [String: [[String: Any]]] else {
            print("Invalid type")
            return CoinList(coins: [])
        }
        return CoinList(from: coinData)
    }
}
    
    
    
    struct CryptoCurrency: Decodable {
        let id: String
        let icon: String
        let name: String
        let symbol: String
        let rank: Double
        let price: Double
        let priceBtc: Double
        let volume: Double
        let marketCap: Double
        let availableSupply: Double
        let totalSupply: Double
        let priceChange1h: Double
        let priceChange1d: Double
        let priceChange1w: Double
        
        
        var shortDescription: String {
        """
        Coin: \(symbol)
        Price USD: \(String(format: "%.2f", price))
        Day change: \(priceChange1d)
        """
        }
        var fullInfo: String {
        """
        Coin: \(name)
        Rank: \(rank)
        Symbol: \(symbol)
        Price USD: \(price)
        Price BTC: \(priceBtc)
        Volume: \(volume)
        Market Cap: \(marketCap)
        Available supply: \(availableSupply)
        Total supply: \(totalSupply)
        Price change 1h: \(priceChange1h)
        Price change 1d: \(priceChange1d)
        Price change 1w: \(priceChange1w)
        """
        }
    }

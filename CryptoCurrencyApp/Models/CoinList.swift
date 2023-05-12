//
//  CryptoCurrency.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 06.05.2023.
//

import Foundation

struct CoinList: Decodable {
    let coins: [CryptoCurrency]
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
    
    init(id: String, icon: String, name: String, symbol: String, rank: Double, price: Double, priceBtc: Double, volume: Double, marketCap: Double, availableSupply: Double, totalSupply: Double, priceChange1h: Double, priceChange1d: Double, priceChange1w: Double) {
        self.id = id
        self.icon = icon
        self.name = name
        self.symbol = symbol
        self.rank = rank
        self.price = price
        self.priceBtc = priceBtc
        self.volume = volume
        self.marketCap = marketCap
        self.availableSupply = availableSupply
        self.totalSupply = totalSupply
        self.priceChange1h = priceChange1h
        self.priceChange1d = priceChange1d
        self.priceChange1w = priceChange1w
    }
    
    init(from coinData: [String: Any]) {
        id = coinData["id"] as? String ?? ""
        icon = coinData["icon"] as? String ?? ""
        name = coinData["name"] as? String ?? ""
        symbol = coinData["symbol"] as? String ?? ""
        rank = coinData["rank"] as? Double ?? 0
        price = coinData["price"] as? Double ?? 0
        priceBtc = coinData["priceBtc"] as? Double ?? 0
        volume = coinData["volume"] as? Double ?? 0
        marketCap = coinData["marketCap"] as? Double ?? 0
        availableSupply = coinData["availableSupply"] as? Double ?? 0
        totalSupply = coinData["totalSupply"] as? Double ?? 0
        priceChange1h = coinData["priceChange1h"] as? Double ?? 0
        priceChange1d = coinData["priceChange1d"] as? Double ?? 0
        priceChange1w = coinData["priceChange1w"] as? Double ?? 0
    }
    
    static func getCoins(from value: Any) -> [CryptoCurrency] {
        guard let coinData = value as? [String: Any] else { return [] }
        return coinData.map { CryptoCurrency(from: $0) }
    }
}

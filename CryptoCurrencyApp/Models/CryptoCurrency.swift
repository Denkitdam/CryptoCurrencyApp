//
//  CryptoCurrency.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 06.05.2023.
//

import Foundation

struct Coins: Decodable {
    let coins: [CryptoCurrency]
}

struct CryptoCurrency: Decodable {
    let id: String
    let icon: URL
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
    
}

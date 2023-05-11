//
//  NetworkManager.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 10.05.2023.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCoins(with url: URL, completion: @escaping(Result<[CryptoCurrency], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No Localised description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let coinList = try decoder.decode(CoinList.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(coinList.coins))
                }
            } catch {
                completion(.failure(.decodingError))
                print(error)
            }
        }.resume()
    }
    func fetchLogo(with url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
                    
        }
    }
}

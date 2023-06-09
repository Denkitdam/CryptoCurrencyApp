//
//  NetworkManager.swift
//  CryptoCurrencyApp
//
//  Created by Denis Kitaev on 10.05.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCryptocurrency(from url: URL, completion: @escaping(Result<CoinList, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let coinList = CoinList.getCoinList(From: value)
                    completion(.success(coinList))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImageData(form url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate().responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

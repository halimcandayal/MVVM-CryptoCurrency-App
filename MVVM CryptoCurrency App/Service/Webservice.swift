//
//  Webservice.swift
//  MVVM CryptoCurrency App
//
//  Created by Halimcan Dayal on 16.03.2022.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            }else if let data = data {
                
                let crytpoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(crytpoList)
                
                if let cryptoList = crytpoList {
                    completion(crytpoList)
                }
            }
        }.resume()
    }
}

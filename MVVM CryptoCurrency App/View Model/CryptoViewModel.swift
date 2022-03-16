//
//  CryptoViewModel.swift
//  MVVM CryptoCurrency App
//
//  Created by Halimcan Dayal on 16.03.2022.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
         return self.cryptoCurrencyList.count
        
    }
         
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
         let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(crytpoCurrency: crypto)
    }
}
    
struct CryptoViewModel {
    let crytpoCurrency: CryptoCurrency
        
    var name: String {
        return self.crytpoCurrency.currency
    }
        
    var price: String {
        return self.crytpoCurrency.price
    }
}

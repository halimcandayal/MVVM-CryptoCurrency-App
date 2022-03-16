//
//  ViewController.swift
//  MVVM CryptoCurrency App
//
//  Created by Halimcan Dayal on 16.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        self.colorArray = [
        
        UIColor(red: 75/255, green: 120/255, blue: 160/255, alpha: 1.0),
        UIColor(red: 35/255, green: 130/255, blue: 33/255, alpha: 1.0),
        UIColor(red: 95/255, green: 100/255, blue: 47/255, alpha: 1.0),
        UIColor(red: 35/255, green: 93/255, blue: 99/255, alpha: 1.0),
        UIColor(red: 122/255, green: 88/255, blue: 101/255, alpha: 1.0),
        UIColor(red: 131/255, green: 77/255, blue: 29/255, alpha: 1.0),
        UIColor(red: 79/255, green: 39/255, blue: 56/255, alpha: 1.0),
        UIColor(red: 29/255, green: 128/255, blue: 93/255, alpha: 1.0),
        UIColor(red: 155/255, green: 184/255, blue: 149/255, alpha: 1.0),
        ]
        
    }
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            
            
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CryptoCurrencyCell
        
        let CryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = CryptoViewModel.price
        cell.currencyText.text = CryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 9]
        
        return cell
    }
}


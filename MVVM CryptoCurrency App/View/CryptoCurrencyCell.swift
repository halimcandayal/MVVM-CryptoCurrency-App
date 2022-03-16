//
//  CryptoCurrencyCell.swift
//  MVVM CryptoCurrency App
//
//  Created by Halimcan Dayal on 16.03.2022.
//

import UIKit

class CryptoCurrencyCell: UITableViewCell {

    @IBOutlet weak var currencyText: UILabel!
    
    @IBOutlet weak var priceText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

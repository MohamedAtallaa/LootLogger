//
//  DetailsViewController.swift
//  LootLogger
//
//  Created by Mohamed Atallah on 01/02/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var serialTextField: UITextField!
    @IBOutlet var valueTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!

    
    // MARK: - Properties
    var item: Item!
    
    let numberFormater: NumberFormatter = {
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = .decimal
        numberFormater.minimumFractionDigits = 2
        numberFormater.maximumFractionDigits = 2
        
        return numberFormater
    }()
    
    let dateFormater: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        
        return dateFormater
    }()
    
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameTextField.text = item.name
        serialTextField.text = item.serialNumber
        valueTextField.text = numberFormater.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormater.string(from: item.dateCreated)
    }
    
    
    // MARK: - Actions
    
    



    
}

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
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
        // "save" changes to item
        item.name = nameTextField.text ?? ""
        item.serialNumber = serialTextField.text
        if let valueText = valueTextField.text, let value = numberFormater.number(from: valueText) {
            item.valueInDollars = value.intValue
        }else {
            item.valueInDollars = 0
        }
    }
    
    
    // MARK: - Actions
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func choosePhotoSource(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.modalPresentationStyle = .popover
        alertController.popoverPresentationController?.barButtonItem = sender
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
            print("present Camera")
        }
        alertController.addAction(cameraAction)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
            print("present library")
        }
        alertController.addAction(photoLibraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
}

// MARK: - Extensions
extension DetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

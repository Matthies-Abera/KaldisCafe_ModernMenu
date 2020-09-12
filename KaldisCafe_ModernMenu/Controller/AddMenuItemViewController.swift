//
//  AddMenuItemViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 31/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class AddMenuItemViewController: UIViewController {

    var menu: Menu?
    
    var selectedItemsArray: [String] = []
    
    var menuRowSelected = 0
    var subMenuRowSelected = 0
    
    @IBOutlet weak var menuTypePicker: UIPickerView!
    @IBOutlet weak var subMenuTypePicker: UIPickerView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var invalidItemLabel: UILabel!
    @IBOutlet weak var priceStepperOutlet: UIStepper!
    
    @IBAction func priceStepper(_ sender: UIStepper) {
        priceLabel.text = "$\(sender.value/2)0"
    }
    
    @IBAction func addItemPressed(_ sender: RoundButton) {
        
        if nameTextField.text != "" && descriptionTextField.text != "" {
            
            invalidItemLabel.isHidden = true
            
            // ALL THE PROPERTIES OF ITEM TO ADD TO MENU
            let itemName = nameTextField.text!
            let itemDescription = descriptionTextField.text!
            let selectedPrice = Float(priceStepperOutlet.value/2)
            
            if let safeMenu = menu {
                if(!safeMenu.alreadyContains(itemName)) {
                    DispatchQueue.main.async {
                        let item = MenuItem(name: itemName, description: itemDescription, price: selectedPrice)
                        safeMenu.add(item, in: self.menuRowSelected, and: self.subMenuRowSelected)
                    }
                } else {
                    invalidItemLabel.text = "Invalid Item: Menu Already Contains Item"
                    invalidItemLabel.isHidden = false
                }
            }
        } else {
            invalidItemLabel.text = "Invalid Item: Please Enter Values for All Relevant Fields"
            invalidItemLabel.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ASSIGNING DELEGATES
        menuTypePicker.dataSource = self
        menuTypePicker.delegate = self
        
        subMenuTypePicker.dataSource = self
        subMenuTypePicker.delegate = self
        
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        
        // DEFAULT SUB MENU
        if let safeMenu = menu {
            self.selectedItemsArray = safeMenu.subMenuNames[0]
        }
        
        // SCREEN ADJUSTMENT
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.hideKeyboardWhenTappedAround()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/1.5
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}

//MARK: - UITextFieldDelegate

extension AddMenuItemViewController: UITextFieldDelegate {
    
    // Notifies the UI when return has been pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTextField {
            nameTextField.endEditing(true)
        } else if textField == descriptionTextField {
            descriptionTextField.endEditing(true)
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if(textField.text != "") {
            return true
        } else {
            textField.placeholder = "Type Something"
            return true
        }
    }
}

//MARK: - UIPickerViewDataSource

extension AddMenuItemViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if let safeMenu = menu {
            if pickerView == menuTypePicker {
                return safeMenu.menu.count
            } else if pickerView == subMenuTypePicker {
                return selectedItemsArray.count
            }
        }
        
        return 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

//MARK: - UIPickerViewDelegate

extension AddMenuItemViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if let safeMenu = menu {
            if pickerView == menuTypePicker {
                return safeMenu.menuNames[row]
            } else if pickerView == subMenuTypePicker {
                return selectedItemsArray[row]
            }
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == menuTypePicker {
            menuRowSelected = row
            
            if let safeMenu = menu {
                switch row {
                case 0:
                    selectedItemsArray = safeMenu.subMenuNames[0]
                case 1:
                    selectedItemsArray = safeMenu.subMenuNames[1]
                default:
                    selectedItemsArray = safeMenu.subMenuNames[0]
                }
            }
            
            // IMPORTANT reload the data on the item picker
            subMenuTypePicker.reloadAllComponents()
        } else if pickerView == subMenuTypePicker {
            subMenuRowSelected = row
        }
    }
    
}

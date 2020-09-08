//
//  EditMenuItemViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 5/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

// TODO: AT LATER STAGE - EDIT MENU TYPE MANAGER SO IT REFERS TO THE MENU OBJECT RATHER THAN JUST AN ARRAY OF STRINGS

class EditMenuItemViewController: UIViewController {

    var menu = MenuBrain()
    
    var menuTypesManager = MenuTypesManager()
    
    var selectedMenuArray: [String] = []
    
    var menuRowSelected = 0
    var subMenuRowSelected = 0
    var menuItemSelected = 0
    
    @IBOutlet weak var menuTypePicker: UIPickerView!
    @IBOutlet weak var subMenuTypePicker: UIPickerView!
    @IBOutlet weak var menuItemPicker: UIPickerView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var invalidItemLabel: UILabel!
    @IBOutlet weak var priceStepperOutlet: UIStepper!
    
    @IBAction func priceStepper(_ sender: UIStepper) {
        priceLabel.text = "$\(sender.value/2)0"
    }
    
    @IBAction func editItemPressed(_ sender: RoundButton) {
        
        if nameTextField.text != "" && descriptionTextField.text != "" {
            
            invalidItemLabel.isHidden = true
            
            // ALL THE PROPERTIES OF ITEM TO ADD TO MENU
            let itemName = nameTextField.text!
            let itemDescription = descriptionTextField.text!
            let selectedPrice = Float(priceStepperOutlet.value/2)
            
            DispatchQueue.main.async {
                let item = MenuItem(name: itemName, description: itemDescription, price: selectedPrice)
                self.menu.edit(item, in: self.menuRowSelected, and: self.subMenuRowSelected, and: self.menuItemSelected)
                self.menuItemPicker.reloadAllComponents()
            }
        } else {
            invalidItemLabel.text = "Invalid Item: Please Enter Values for All Relevant Fields"
            invalidItemLabel.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // PRE LOAD CORRECT VIEW FOR FIRST ITEM DISPLAYED
        nameTextField.text = menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].name
        descriptionTextField.text = menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].description
        priceStepperOutlet.value = Double(menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].price)*2
        priceLabel.text = "$\(priceStepperOutlet.value/2)0"
        
        // ASSIGNING DELEGATES
        menuTypePicker.dataSource = self
        menuTypePicker.delegate = self
        
        subMenuTypePicker.dataSource = self
        subMenuTypePicker.delegate = self
        
        menuItemPicker.dataSource = self
        menuItemPicker.delegate = self
        
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        
        // DEFAULT SUB MENUS
        self.selectedMenuArray = menuTypesManager.subMenuNames[0]
        
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

extension EditMenuItemViewController: UITextFieldDelegate {
    
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

extension EditMenuItemViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == menuTypePicker {
            return menu.menu.count
        } else if pickerView == subMenuTypePicker {
            return menu.menu[menuRowSelected].count
        } else if pickerView == menuItemPicker {
            return menu.menu[menuRowSelected][subMenuRowSelected].count
        }
        return 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

//MARK: - UIPickerViewDelegate

extension EditMenuItemViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let namesOfItems = menu.menu[menuRowSelected][subMenuRowSelected].map {$0.name}
        
        if pickerView == menuTypePicker {
            return menuTypesManager.menuNames[row]
        } else if pickerView == subMenuTypePicker {
            if menuRowSelected ==  0 {
                return menuTypesManager.subMenuNames[menuRowSelected][row]
            } else if menuRowSelected == 1 {
                return menuTypesManager.subMenuNames[menuRowSelected][row]
            }
        } else if pickerView == menuItemPicker {
            return namesOfItems[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == menuTypePicker {
            menuRowSelected = row
            subMenuRowSelected = 0
            menuItemSelected = 0
            subMenuTypePicker.reloadAllComponents()
            menuItemPicker.reloadAllComponents()
        } else if pickerView == subMenuTypePicker {
            subMenuRowSelected = row
            menuItemSelected = 0
            menuItemPicker.reloadAllComponents()
        } else if pickerView == menuItemPicker {
            menuItemSelected = row
        }
        
        // ADJUSTS ALL PICKER VIEWS
        self.menuTypePicker.selectRow(menuRowSelected, inComponent: 0, animated: true)
        self.subMenuTypePicker.selectRow(subMenuRowSelected, inComponent: 0, animated: true)
        self.menuItemPicker.selectRow(menuItemSelected, inComponent: 0, animated: true)
        
        // ADJUST NAME, DESCRIPTION AND PRICE LABELS (+ STEPPER VALUE)
        nameTextField.text = menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].name
        descriptionTextField.text = menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].description
        priceStepperOutlet.value = Double(menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].price)*2
        priceLabel.text = "$\(priceStepperOutlet.value/2)0"
    }
    
}

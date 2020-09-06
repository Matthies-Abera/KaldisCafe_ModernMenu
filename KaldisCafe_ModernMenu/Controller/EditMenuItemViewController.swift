//
//  EditMenuItemViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 5/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class EditMenuItemViewController: UIViewController {

    var menu = MenuBrain()
    
    var menuTypesManager = MenuTypesManager()
    
    var selectedMenuArray: [String] = []
    var selectedSubMenuArray: [String] = []
    
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
        self.selectedSubMenuArray = menuTypesManager.foodSubMenus[0]
        
        // SCREEN ADJUSTMENT
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

//MARK: - UITextFieldDelegate
extension EditMenuItemViewController: UITextFieldDelegate {
    
    // TODO: CAN REMOVE LATER
    @IBAction func searchPressed(_ sender: UIButton) {
        
        if sender == nameTextField {
            nameTextField.endEditing(true)
        } else if sender == descriptionTextField {
            descriptionTextField.endEditing(true)
        }
    }
    
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
        
        // TODO: EDIT RETURN VALUE TO ALLOW TO END EDITING ON EMPTY STRING
        if(textField.text != "") {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
}

//MARK: - UIPickerViewDataSource
extension EditMenuItemViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == menuTypePicker {
            return menuTypesManager.menuNames.count
        } else if pickerView == subMenuTypePicker {
            return menuTypesManager.subMenuNames[menuRowSelected].count
        } else if pickerView == menuItemPicker {
            if menuRowSelected == 0 {
                return menuTypesManager.foodSubMenus[subMenuRowSelected].count
            } else if menuRowSelected == 1 {
                return menuTypesManager.drinkSubMenus[subMenuRowSelected].count
            }
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
        if pickerView == menuTypePicker {
            return menuTypesManager.menuNames[row]
        } else if pickerView == subMenuTypePicker {
            if menuRowSelected ==  0 {
                return menuTypesManager.subMenuNames[menuRowSelected][row]
            } else if menuRowSelected == 1 {
                return menuTypesManager.subMenuNames[menuRowSelected][row]
            }
        } else if pickerView == menuItemPicker {
            if menuRowSelected ==  0 {
                return menuTypesManager.foodSubMenus[subMenuRowSelected][row]
            } else if menuRowSelected == 1 {
                return menuTypesManager.drinkSubMenus[subMenuRowSelected][row]
            }
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == menuTypePicker {
            menuRowSelected = row
            subMenuRowSelected = 0
            menuItemSelected = 0
            
            switch row {
            case 0:
                selectedMenuArray = menuTypesManager.subMenuNames[row]
                selectedSubMenuArray = menuTypesManager.foodSubMenus[row]
            case 1:
                selectedMenuArray = menuTypesManager.subMenuNames[row]
                selectedSubMenuArray = menuTypesManager.foodSubMenus[row]
            default:
                print("Error upon selection")
            }
            
            // IMPORTANT reload the data on the item picker
            subMenuTypePicker.reloadAllComponents()
            menuItemPicker.reloadAllComponents()
        } else if pickerView == subMenuTypePicker {
            subMenuRowSelected = row
            menuItemSelected = 0
            
            if menuRowSelected == 0 {
                switch row {
                case 0:
                    selectedSubMenuArray = menuTypesManager.foodSubMenus[row]
                case 1:
                    selectedSubMenuArray = menuTypesManager.foodSubMenus[row]
                case 2:
                    selectedSubMenuArray = menuTypesManager.foodSubMenus[row]
                case 3:
                    selectedSubMenuArray = menuTypesManager.foodSubMenus[row]
                default:
                    print("Error upon selection")
                }
            } else if menuRowSelected == 1 {
                switch row {
                case 0:
                    selectedSubMenuArray = menuTypesManager.drinkSubMenus[row]
                case 1:
                    selectedSubMenuArray = menuTypesManager.drinkSubMenus[row]
                default:
                    print("Error upon selection")
                }
            }
            
            // IMPORTANT reload the data on the item picker
            menuItemPicker.reloadAllComponents()
        } else if pickerView == menuItemPicker {
            menuItemSelected = row
        }
        
        // ADJUSTS ALL PICKER VIEWS
        self.menuTypePicker.selectRow(menuRowSelected, inComponent: 0, animated: false)
        self.subMenuTypePicker.selectRow(subMenuRowSelected, inComponent: 0, animated: false)
        self.menuItemPicker.selectRow(menuItemSelected, inComponent: 0, animated: false)
        
        // ADJUST NAME, DESCRIPTION AND PRICE LABELS (+ STEPPER VALUE)
        nameTextField.text = menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].name
        descriptionTextField.text = menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].description
        priceStepperOutlet.value = Double(menu.menu[menuRowSelected][subMenuRowSelected][menuItemSelected].price)*2
        priceLabel.text = "$\(priceStepperOutlet.value/2)0"
    }
    
}

//MARK: - MenuTypesManagerDelegate
extension EditMenuItemViewController: MenuTypesManagerDelegate {
    
    // TODO: CAN REMOVE LATER
    func didUpdateSubMenuTypes(_ MenuTypesManager: MenuTypesManager, _ subMenu: [String]) {
        DispatchQueue.main.async {
            
            // NOT CURRENTLY NEEDED
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

//
//  DeleteItemViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 6/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

// TODO: AT LATER STAGE - UPDATE PICKER VIEWS ONCE ITEM IS DELETE

class DeleteMenuItemViewController: UIViewController {

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
    
    @IBAction func deleteItemPressed(_ sender: RoundButton) {
        
        DispatchQueue.main.async {
            print(self.menu.menu[self.menuRowSelected][self.subMenuRowSelected].count)
            self.menu.deleteItem(in: self.menuRowSelected, and: self.subMenuRowSelected, and: self.menuItemSelected)
            print(self.menu.menu[self.menuRowSelected][self.subMenuRowSelected].count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ASSIGNING DELEGATES
        menuTypePicker.dataSource = self
        menuTypePicker.delegate = self
        
        subMenuTypePicker.dataSource = self
        subMenuTypePicker.delegate = self
        
        menuItemPicker.dataSource = self
        menuItemPicker.delegate = self
        
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


//MARK: - UIPickerViewDataSource
extension DeleteMenuItemViewController: UIPickerViewDataSource {
    
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
extension DeleteMenuItemViewController: UIPickerViewDelegate {
    
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
    }
    
}

//MARK: - MenuTypesManagerDelegate
extension DeleteMenuItemViewController: MenuTypesManagerDelegate {
    
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


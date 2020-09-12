//
//  DeleteItemViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 6/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class DeleteMenuItemViewController: UIViewController {

    var menu: Menu?
    
    var selectedMenuArray: [String] = []
    
    var menuRowSelected = 0
    var subMenuRowSelected = 0
    var menuItemSelected = 0
    
    @IBOutlet weak var menuTypePicker: UIPickerView!
    @IBOutlet weak var subMenuTypePicker: UIPickerView!
    @IBOutlet weak var menuItemPicker: UIPickerView!
    
    @IBAction func deleteItemPressed(_ sender: RoundButton) {
        
        DispatchQueue.main.async {
            
            if let safeMenu = self.menu {
                if (safeMenu.menu[self.menuRowSelected][self.subMenuRowSelected].count > 0) {
                    self.menu?.deleteItem(in: self.menuRowSelected, and: self.subMenuRowSelected, and: self.menuItemSelected)
                    self.menuItemPicker.reloadAllComponents()
                    
                    if (self.menuItemSelected == safeMenu.menu[self.menuRowSelected][self.subMenuRowSelected].count) {
                        self.menuItemSelected -= 1
                    }
                }
            }
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
        
        // DEFAULT SUB MENU
        if let safeMenu = menu {
            self.selectedMenuArray = safeMenu.subMenuNames[0]
        }
    }

}

//MARK: - UIPickerViewDataSource
extension DeleteMenuItemViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if let safeMenu = menu {
            if pickerView == menuTypePicker {
                return safeMenu.menu.count
            } else if pickerView == subMenuTypePicker {
                return safeMenu.menu[menuRowSelected].count
            } else if pickerView == menuItemPicker {
                return safeMenu.menu[menuRowSelected][subMenuRowSelected].count
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
        
        if let safeMenu = menu {
            let namesOfItems = safeMenu.menu[menuRowSelected][subMenuRowSelected].map {$0.name}
            
            if pickerView == menuTypePicker {
                return safeMenu.menuNames[row]
            } else if pickerView == subMenuTypePicker {
                if menuRowSelected ==  0 {
                    return safeMenu.subMenuNames[menuRowSelected][row]
                } else if menuRowSelected == 1 {
                    return safeMenu.subMenuNames[menuRowSelected][row]
                }
            } else if pickerView == menuItemPicker {
                return namesOfItems[row]
            }
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
    }
}

//
//  DeleteItemViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 6/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

// TODO: AT LATER STAGE - UPDATE PICKER VIEWS ONCE ITEM IS DELETE
// TODO: AT LATER STAGE - EDIT MENU TYPE MANAGER SO IT REFERS TO THE MENU OBJECT RATHER THAN JUST AN ARRAY OF STRINGS

class DeleteMenuItemViewController: UIViewController {

    var menu = MenuBrain()
    
    var menuTypesManager = MenuTypesManager()
    
    var selectedMenuArray: [String] = []
    
    var menuRowSelected = 0
    var subMenuRowSelected = 0
    var menuItemSelected = 0
    
    @IBOutlet weak var menuTypePicker: UIPickerView!
    @IBOutlet weak var subMenuTypePicker: UIPickerView!
    @IBOutlet weak var menuItemPicker: UIPickerView!
    
    @IBAction func deleteItemPressed(_ sender: RoundButton) {
        
        DispatchQueue.main.async {
            self.menu.deleteItem(in: self.menuRowSelected, and: self.subMenuRowSelected, and: self.menuItemSelected)
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
        self.selectedMenuArray = menuTypesManager.subMenuNames[0]
    }

}

//MARK: - UIPickerViewDataSource
extension DeleteMenuItemViewController: UIPickerViewDataSource {
    
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
extension DeleteMenuItemViewController: UIPickerViewDelegate {
    
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
    }
}

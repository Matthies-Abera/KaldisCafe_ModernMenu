//
//  AddMenuItemViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 31/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class AddMenuItemViewController: UIViewController {

    var menuTypesManager = MenuTypesManager()
    var menuSelected : String?
    var selectedItemsArray: [String] = []
    
    @IBOutlet weak var menuTypePicker: UIPickerView!
    @IBOutlet weak var subMenuTypePicker: UIPickerView!
    
    var menu = Menu()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTypePicker.dataSource = self
        menuTypePicker.delegate = self
        subMenuTypePicker.dataSource = self
        subMenuTypePicker.delegate = self
        
        // DEFAULT SUB MENU
        self.selectedItemsArray = menuTypesManager.subMenuNames[0]
    }

}

//MARK: - UIPickerViewDataSource

extension AddMenuItemViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == menuTypePicker {
            return menuTypesManager.menuNames.count
        } else if pickerView == subMenuTypePicker {
            return selectedItemsArray.count
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
        if pickerView == menuTypePicker {
            return menuTypesManager.menuNames[row]
        } else if pickerView == subMenuTypePicker {
                return selectedItemsArray[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == menuTypePicker {
            switch row {
            case 0:
                selectedItemsArray = menuTypesManager.subMenuNames[0]
            case 1:
                selectedItemsArray = menuTypesManager.subMenuNames[1]
            default:
                selectedItemsArray = menuTypesManager.subMenuNames[0]
            }
            
            // IMPORTANT reload the data on the item picker
            subMenuTypePicker.reloadAllComponents()
        }
    }
    
}

//MARK: - CoinManagerDelegate

extension AddMenuItemViewController: MenuTypesManagerDelegate {
    
    func didUpdateSubMenuTypes(_ MenuTypesManager: MenuTypesManager, _ subMenu: [String]) {
        DispatchQueue.main.async {
            
            // TODO: ADJUST FOR APP
            // NOT CURRENTLY NEEDED
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

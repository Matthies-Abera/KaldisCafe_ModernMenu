//
//  ItemInfoViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 30/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class ItemInfoViewController: UIViewController {

    var menu = Menu()
    var chosenMenuItem : String?
    
    @IBOutlet weak var itemInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeMenuItem = chosenMenuItem {
            itemInformationLabel.text = displayItemInformation(for: safeMenuItem)
        }
    }
    
    func displayItemInformation(for chosenItem: String) -> String {

        let name = menu.get("name", of: chosenItem)
        let description = menu.get("description", of: chosenItem)
        let price = menu.get("price", of: chosenItem)

        return "Name: \(name) \n\nDescription: \(description) \n\nPrice: $\(price)"
    }
    
}

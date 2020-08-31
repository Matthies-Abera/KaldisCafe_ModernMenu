//
//  ItemInfoViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 30/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class ItemInfoViewController: UIViewController {

    var chosenMenuItem : String?
    var menu = Menu()
    
    @IBOutlet weak var itemInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeMenuItem = chosenMenuItem {
            itemInformationLabel.text = displayItemInformation(for: safeMenuItem)
        }
    }
    
    func displayItemInformation(for chosenItem: String) -> String {

        let name = menu.get("name", of: chosenItem, in: menu.menu)
        let description = menu.get("description", of: chosenItem, in: menu.menu)
        let price = menu.get("price", of: chosenItem, in: menu.menu)

        return "Name: \(name) \n\nDescription: \(description) \n\nPrice: $\(price)"
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

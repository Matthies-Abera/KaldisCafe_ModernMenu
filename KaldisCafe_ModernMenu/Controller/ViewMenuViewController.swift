//
//  ViewMenuViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 31/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class ViewMenuViewController: UIViewController {

    var menu: Menu?
    var menuItemPressed : String?
    
    @IBAction func menuItemPressed(_ sender: RoundButton) {
        
        if let safeMenuItem = sender.currentTitle {
            menuItemPressed = safeMenuItem
        }
        
        self.performSegue(withIdentifier: "goToItemInfo", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToItemInfo") {
            let destinationVC = segue.destination as! ItemInfoViewController
            
            destinationVC.menu = menu!
            destinationVC.chosenMenuItem = menuItemPressed!
        }
    }

}

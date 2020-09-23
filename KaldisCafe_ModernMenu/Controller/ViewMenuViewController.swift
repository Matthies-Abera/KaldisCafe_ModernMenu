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
    var tables: Tables?
    var todaysRevenue: Float?
    var menuItemPressed : String?
    
    @IBOutlet weak var todaysRevenueLabel: UIBarButtonItem!
    
    @IBAction func menuItemPressed(_ sender: RoundButton) {
        
        if let safeMenuItem = sender.currentTitle {
            menuItemPressed = safeMenuItem
        }
        
        self.performSegue(withIdentifier: "goToItemInfo", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let safeTables = tables {
            todaysRevenueLabel.title = "Today's Revenue: \(safeTables.todaysRevenue)0"
        }
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

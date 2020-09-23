//
//  MenuOptionsViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 30/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class MenuOptionsViewController: UIViewController {

    var menu: Menu?
    var tables: Tables?
    @IBOutlet weak var todaysRevenueLabel: UIBarButtonItem!
    
    @IBAction func viewMenuPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToViewMenu", sender: self)
    }
    
    @IBAction func addMenuItemPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToAddMenuItem", sender: self)
    }
    
    @IBAction func editMenuItemPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToEditMenuItem", sender: self)
    }
    
    @IBAction func deleteMenuItemPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToDeleteMenuItem", sender: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let safeTables = tables {
            todaysRevenueLabel.title = "Today's Revenue: \(safeTables.todaysRevenue)0"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "goToViewMenu") {
            let destinationVC = segue.destination as! ViewMenuViewController
            destinationVC.menu = menu!
            destinationVC.tables = tables!
        } else if (segue.identifier == "goToAddMenuItem") {
            let destinationVC = segue.destination as! AddMenuItemViewController
            destinationVC.menu = menu!
        } else if (segue.identifier == "goToEditMenuItem") {
            let destinationVC = segue.destination as! EditMenuItemViewController
            destinationVC.menu = menu!
        } else if (segue.identifier == "goToDeleteMenuItem") {
            let destinationVC = segue.destination as! DeleteMenuItemViewController
            destinationVC.menu = menu!
        }
    }
}

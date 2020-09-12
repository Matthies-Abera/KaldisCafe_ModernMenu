//
//  ViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 23/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // origin initialisation of two core classes
    var menu = Menu()
    var tables = Tables()
    
    @IBAction func analyticsPressed(_ sender: RoundButton) {
        // self.performSegue(withIdentifier: "goToAnalytics", sender: self)
    }
    
    @IBAction func orderPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToTables", sender: self)
    }
    
    @IBAction func menuPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToMenuOptions", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "goToMenuOptions") {
           let destinationVC = segue.destination as! MenuOptionsViewController
           destinationVC.menu = menu
        } else if (segue.identifier == "goToTables") {
            let destinationVC = segue.destination as! TablesViewController
            destinationVC.menu = menu
            destinationVC.tables = tables
        }
    }

}

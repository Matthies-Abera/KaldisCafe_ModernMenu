//
//  ViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 23/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBAction func analyticsPressed(_ sender: RoundButton) {
        // self.performSegue(withIdentifier: "goToAnalytics", sender: self)
    }
    
    @IBAction func orderPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToTables", sender: self)
    }
    
    @IBAction func menuPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToMenuOptions", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // IMPLEMENT HERE
    }

}

//
//  MenuOptionsViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 30/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class MenuOptionsViewController: UIViewController {

    @IBAction func viewMenuPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToViewMenu", sender: self)
    }
    
    @IBAction func addMenuItemPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToAddMenuItem", sender: self)
    }
    
    @IBAction func editMenuItemPressed(_ sender: RoundButton) {
    }
    
    @IBAction func deleteMenuItemPressed(_ sender: RoundButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

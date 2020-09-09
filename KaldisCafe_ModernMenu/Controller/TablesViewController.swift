//
//  TablesViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 9/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class TablesViewController: UIViewController {

    
    @IBAction func tablePressed(_ sender: RoundButton) {
        
        // TODO: ENCLOSE LATER IN AN IF STATEMENT
        self.showAlertButtonTapped(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
    
        // create the alert
        let alert = UIAlertController(title: "New Table", message: "Would you like to open a new table?", preferredStyle: UIAlertController.Style.alert)
    
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
            self.performSegue(withIdentifier: "goToDocket", sender: self)
        }))
    
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
    
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

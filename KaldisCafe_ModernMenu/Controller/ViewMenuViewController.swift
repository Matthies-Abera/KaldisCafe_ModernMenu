//
//  ViewMenuViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 30/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class ViewMenuViewController: UIViewController {

    var theMenu = Menu()
    
    @IBAction func menuItemPressed(_ sender: RoundButton) {
        self.performSegue(withIdentifier: "goToItemInfo", sender: self)
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

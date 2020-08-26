//
//  ViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 23/8/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var test = Menu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(test.menu[0][0][0].description)
    }


}


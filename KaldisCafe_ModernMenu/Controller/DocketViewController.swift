//
//  DocketViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 9/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class DocketViewController: UIViewController {
    
    var docket: Docket?
    var menuItemPressed: String?
    @IBOutlet weak var docketTextView: UITextView!
    
    @IBOutlet weak var docketNumberLabel: UILabel!
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var docketAmountLabel: UILabel!
    
    @IBOutlet weak var docketItem1: RoundButton!
    @IBOutlet weak var docketItem2: RoundButton!
    @IBOutlet weak var docketItem3: RoundButton!
    @IBOutlet weak var docketItem4: RoundButton!
    @IBOutlet weak var docketItem5: RoundButton!
    @IBOutlet weak var docketItem6: RoundButton!
    @IBOutlet weak var docketItem7: RoundButton!
    @IBOutlet weak var docketItem8: RoundButton!
    @IBOutlet weak var docketItem9: RoundButton!
    @IBOutlet weak var docketItem10: RoundButton!
    @IBOutlet weak var docketItem11: RoundButton!
    @IBOutlet weak var docketItem12: RoundButton!
    @IBOutlet weak var docketItem13: RoundButton!
    @IBOutlet weak var docketItem14: RoundButton!
    @IBOutlet weak var docketItem15: RoundButton!
    @IBOutlet weak var docketItem16: RoundButton!
    @IBOutlet weak var docketItem17: RoundButton!
    @IBOutlet weak var docketItem18: RoundButton!
    @IBOutlet weak var docketItem19: RoundButton!
    @IBOutlet weak var docketItem20: RoundButton!
    @IBOutlet weak var docketItem21: RoundButton!
    @IBOutlet weak var docketItem22: RoundButton!
    @IBOutlet weak var docketItem23: RoundButton!
    @IBOutlet weak var docketItem24: RoundButton!
    @IBOutlet weak var docketItem25: RoundButton!
    @IBOutlet weak var docketItem26: RoundButton!
    @IBOutlet weak var docketItem27: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeDocket = docket {
            docketNumberLabel.text = "Docket: \(safeDocket.docketNumber)"
            tableNumberLabel.text = "Table: \(safeDocket.tableNumber)"
            docketTextView.text = safeDocket.displayDocket()
            docketAmountLabel.text = "Total: $\(safeDocket.getTotalAmount())0"
        }
        
        // array of docket items - code reusability
        // generates relevant gestures for all buttons
        for button in [docketItem1, docketItem2, docketItem3, docketItem4, docketItem5, docketItem6, docketItem7, docketItem8,
                       docketItem9, docketItem10, docketItem11, docketItem12, docketItem13, docketItem14, docketItem15, docketItem16,
                       docketItem17, docketItem18, docketItem19, docketItem20, docketItem21, docketItem22, docketItem23, docketItem24,
                       docketItem25, docketItem26, docketItem27] {
        
            // initialising all the various types of taps and hold for the docket view
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
            let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
            let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
            
            tapGestureRecognizer.numberOfTapsRequired = 1
            doubleTapGestureRecognizer.numberOfTapsRequired = 2
            
            button!.addGestureRecognizer(tapGestureRecognizer)
            button!.addGestureRecognizer(doubleTapGestureRecognizer)
            button!.addGestureRecognizer(longPressRecognizer)
            
            tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
        }
    }
    
    // gesture function for single tap
    @objc func tapped(sender: UITapGestureRecognizer){
        
        if let button = sender.view as? UIButton {
            if let safeMenuItem = button.currentTitle {
                if let safeDocket = docket {
                    if !safeDocket.doesDocketContain(safeMenuItem) {
                        safeDocket.addItem(safeMenuItem)
                    } else {
                        safeDocket.increaseQuantity(of: safeMenuItem)
                    }
                    
                    // update docket receipt and total amount
                    docketTextView.text = safeDocket.displayDocket()
                    docketAmountLabel.text = "Total: $\(safeDocket.getTotalAmount())0"
                }
            }
        }
    }

    // gesture function for double tap
    @objc func doubleTapped(sender: UITapGestureRecognizer){
        if let button = sender.view as? UIButton {
            if let safeMenuItem = button.currentTitle {
                if let safeDocket = docket {
                    if safeDocket.doesDocketContain(safeMenuItem) {
                         safeDocket.decreaseQuantity(of: safeMenuItem)
                    }
                    
                    // update docket receipt and total amount
                    docketTextView.text = safeDocket.displayDocket()
                    docketAmountLabel.text = "Total: $\(safeDocket.getTotalAmount())0"
                }
            }
        }
    }
    
    // gesture function for long press
    @objc func longPressed(sender: UILongPressGestureRecognizer) {
        
        if let button = sender.view as? UIButton {
            if let safeMenuItem = button.currentTitle {
                menuItemPressed = safeMenuItem
            }
        }
        
        // TODO: See if alterations can be made so it doesn't have to wait until button is let go but errors dont show in console
        if sender.state == .ended {
            self.performSegue(withIdentifier: "goToItemInfo", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "goToItemInfo") {
            let destinationVC = segue.destination as! ItemInfoViewController

            destinationVC.chosenMenuItem = menuItemPressed!
        }
    }

}

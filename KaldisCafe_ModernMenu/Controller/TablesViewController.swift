//
//  TablesViewController.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 9/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

class TablesViewController: UIViewController {

    var tables = Tables()
    var currentDocketNumber = 1
    var docketToSend: Docket?
    
    @IBAction func tablePressed(_ sender: RoundButton) {
        
        if !tables.isTableOpen(index: sender.tag) {
            // pop up confirmation alert
            self.showAlertButtonTapped(sender)
        } else {
            // assgining corresponding docket for table and performing segue
            self.docketToSend = tables.tables[sender.tag - 1].docket
            self.performSegue(withIdentifier: "goToDocket", sender: self)
        }
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
            
            // alter table button colour to signify it is unavailable
            if (sender.tag >= 1 && sender.tag <= 10) {
                sender.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            } else if (sender.tag >= 11 && sender.tag <= 12) {
                sender.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
            } else if (sender.tag >= 13 && sender.tag <= 16) {
                sender.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            }
            
            // Creating Docket for table selected
            let newDocket = Docket(docketNumber: self.currentDocketNumber, tableNumber: sender.tag, docketItems: [], totalAmount: 0.00, timeClosed: nil, date: nil)
            
            // assigning docket to table
            self.tables.tables[sender.tag - 1].docket = newDocket
            
            // Incrementing current docket number
            self.currentDocketNumber += 1
            
            // prepping docket for new view
            self.docketToSend = newDocket
            
            // Performing segue to docket view
            self.performSegue(withIdentifier: "goToDocket", sender: self)
        }))
    
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
    
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "goToDocket") {
            let destinationVC = segue.destination as! DocketViewController

            destinationVC.docket = docketToSend!
        }
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

//
//  KeyboardExtension.swift
//  KaldisCafe_ModernMenu
//
//  Created by Matthies Abera on 8/9/20.
//  Copyright © 2020 Thinking Bear Solutions. All rights reserved.
//

import UIKit

//MARK: - UIViewConroller

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

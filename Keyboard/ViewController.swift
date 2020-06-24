//
//  ViewController.swift
//  Keyboard
//
//  Created by ALYASI on 6/11/20.
//  Copyright © 2020 ALYASI. All rights reserved.
// UITextFieldDelegate

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
   @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var lllhh: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
     print(TextField.debugDescription)
  
     
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
         }
   

@objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        if self.view.frame.origin.y == 0 {
       // lllhh.frame.origin.y + keyboardSize.height
        }
    }
}

@objc func keyboardWillHide(notification: NSNotification) {
    if self.view.frame.origin.y != 0 {
        self.view.frame.origin.y = 0
    }
 }
  }
//380.0
//304.0

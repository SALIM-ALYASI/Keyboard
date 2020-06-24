//
//  ViewController44.swift
//  Keyboard
//
//  Created by ALYASI on 6/13/20.
//  Copyright © 2020 ALYASI. All rights reserved.
//

import UIKit

class ViewController44: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var gfdgdghfr: UITextField!
    // ... other text field

    // to store the current active textfield
    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
          passwordTextField.delegate = self
           gfdgdghfr.delegate = self
            // call the 'keyboardWillShow' function when the view controller receive the notification that a keyboard is going to be shown
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          
              // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
      
        usernameTextField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        passwordTextField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)


    }
    //create function

    @objc func textFieldDidChange(_ textField: UITextField) {
            if textField == usernameTextField {
                if (usernameTextField.text?.count)! >= 2 {
                    passwordTextField?.becomeFirstResponder()
                }
            }
            else if textField == passwordTextField {
                if (textField.text?.count)! >= 2 {
                    passwordTextField.resignFirstResponder()
                }
            }
        }
       @objc func keyboardWillShow(notification: NSNotification) {

          guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {

            // if keyboard size is not available for some reason, dont do anything
            return
          }

          var shouldMoveViewUp = false

          // if active text field is not nil
          if let activeTextField = activeTextField {

            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            // if the bottom of Textfield is below the top of keyboard, move up
            if bottomOfTextField > topOfKeyboard {
              shouldMoveViewUp = true
            }
          }

          if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
          }
        }
 
        @objc func keyboardWillHide(notification: NSNotification) {
          // move back the root view origin to zero
          self.view.frame.origin.y = 0
        }
 
  // when user select a textfield, this method will be called
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // set the activeTextField to the selected textfield
    self.activeTextField = textField
  }
    
  // when user click 'done' or dismiss the keyboard
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.activeTextField = nil
  }
}

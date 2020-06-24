//
//  ViewController2.swift
//  Keyboard
//
//  Created by ALYASI on 6/12/20.
//  Copyright © 2020 ALYASI. All rights reserved.
//
import UIKit


class ViewController2:UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
 @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var gfdgdghfr: UITextField!
    // ... other text field

    // to store the current active textfield
       var textFieldNavigator: TextFieldNavigation?
     var currentTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
          passwordTextField.delegate = self
           gfdgdghfr.delegate = self
                  textFieldNavigator = TextFieldNavigation()
                    textFieldNavigator?.textFields = [usernameTextField,passwordTextField,emailTextField,gfdgdghfr]
                }

                @objc func keyboardDidShow(notification: NSNotification) {
                    let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                    let keyboardSize:CGSize = keyboardFrame.size
                    let contentInsets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
                    scrollView.contentInset = contentInsets
                    scrollView.scrollIndicatorInsets = contentInsets
                    var aRect:CGRect = self.view.frame
                    aRect.size.height -= keyboardSize.height
                    if currentTextField != nil {
                        if !(aRect.contains(currentTextField!.frame.origin)) {
                            scrollView.scrollRectToVisible(currentTextField!.frame, animated: true)
                        }
                    }
                }
                
                @objc func keyboardWillHide(notification: NSNotification) {
                    let contentInsents:UIEdgeInsets = UIEdgeInsets.zero
                    scrollView.contentInset = contentInsents
                    scrollView.scrollIndicatorInsets = contentInsents
                }
                
                override func viewWillAppear(_ animated: Bool) {
                    super.viewWillAppear(animated)
                    self.view.backgroundColor = .red
                    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
                    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
                }
            }

extension ViewController2: UITextFieldDelegate {
                func textFieldDidBeginEditing(_ textField: UITextField) {
                    currentTextField = textField
                }
                
    internal func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
                    currentTextField = nil
                }
                
                func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                    textField.resignFirstResponder()
                    return true
                }
            }

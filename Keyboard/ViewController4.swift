//
//  ViewController4.swift
//  Keyboard
//
//  Created by ALYASI on 6/13/20.
//  Copyright © 2020 ALYASI. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
   
    @IBOutlet weak var textField_1: UITextField!
    @IBOutlet weak var textField_2: UITextField!
    
    lazy var stackView: UIStackView = {
         let stackView = UIStackView()
         stackView.backgroundColor = .clear
         stackView.axis = .vertical
         stackView.distribution = .fillEqually
         stackView.alignment = .center
         stackView.layoutMargins = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
         stackView.spacing = 10
         stackView.isLayoutMarginsRelativeArrangement = true
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
     var stackViewBottomAnchor = NSLayoutConstraint()
      var atr = 0.0
      
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(stackView)
              self.stackView.addArrangedSubview(textField_1)
              self.stackView.addArrangedSubview(textField_2)
//
              self.stackViewBottomAnchor = self.stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: 0)
        NSLayoutConstraint.activate([
                  stackViewBottomAnchor,
                  stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                  stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                  
                  textField_1.heightAnchor.constraint(equalToConstant: 40),
                  textField_2.heightAnchor.constraint(equalToConstant:40),
                  
                  textField_1.widthAnchor.constraint(equalToConstant: 300),
                  textField_2.widthAnchor.constraint(equalToConstant: 300),
                  
              ])
              
              
               /// keyboard will Show
               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
              
               /// keyboard will Show
               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        initializeKeyboardToolbar()
              
    }
    
     func initializeKeyboardToolbar() {
         let toolbarview = UIView(frame: CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 40))
         toolbarview.backgroundColor = .systemGray6
          let button = UIButton()
         button.setTitle("Done", for: .normal)
         button.setTitleColor(.blue, for: .normal)
        
         button.addTarget(self, action: #selector(didPressDoneButton), for: UIControl.Event.touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         toolbarview.addSubview(button)
         NSLayoutConstraint.activate([
             button.rightAnchor.constraint(equalTo: toolbarview.rightAnchor,constant: -10),
             button.centerYAnchor.constraint(equalTo: toolbarview.centerYAnchor),
             button.widthAnchor.constraint(equalToConstant: 50),
             button.heightAnchor.constraint(equalToConstant: 30)
         
         ])
         
         textField_1.inputAccessoryView = toolbarview
         textField_2.inputAccessoryView = toolbarview
         
         
     }
    // keyboard Will show
    @objc open dynamic func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let height = view.safeAreaInsets.bottom
            let keyboardHeight = keyboardRectangle.height - height

            self.stackViewBottomAnchor.constant = -keyboardHeight
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
     
    }

    // keyboard Will hide
    @objc open dynamic func keyboardWillHide(_ notification: Notification) {
        self.stackViewBottomAnchor.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
       }
    
    
    @objc private func didPressDoneButton() {
        self.view.endEditing(true)
    }

}

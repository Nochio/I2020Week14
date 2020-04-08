//
//  ViewController.swift
//  Week 14
//
//  Created by Thomas Hinrichs on 08/04/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var firebaseManager: FirebaseManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseManager = FirebaseManager(parentVC: self)
    }

    @IBAction func singInBtnPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            if email.count > 5 && pwd.count > 5 {
                firebaseManager?.signIn(email: email, pwd: pwd)
            }
        }
        self.hiddenBtn.isHidden = false
        
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            if email.count > 5 && pwd.count > 5 {
                firebaseManager?.signUp(email: email, pwd: pwd)
            }
        }
    }
    
    @IBAction func signOutBtnPressed(_ sender: UIButton) {
        firebaseManager?.signOut()
        self.hiddenBtn.isHidden = true
    }
    
}


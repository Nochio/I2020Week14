//
//  FirebaseManager.swift
//  Week 14
//
//  Created by Thomas Hinrichs on 08/04/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import Foundation
import FirebaseAuth


class FirebaseManager {
    
    var auth = Auth.auth()
    let parentVC: ViewController

    init(parentVC: ViewController) {
        self.parentVC = parentVC
        auth.addIDTokenDidChangeListener { (auth, user) in
            if user != nil {
                print("Status: user is logged in: \(String(describing: user))")
            } else {
                print("Status: user is logged out")
            }
        }
    }
    
    func signUp(email: String, pwd: String) {
        auth.createUser(withEmail: email, password: pwd) { (result, error) in
            if error == nil {
                print("Succesfully signed up to Firebase \(result.debugDescription)")
            } else {
                print("Failed to sign up \(error.debugDescription)")
            }
        }
    }
    
    func signIn(email: String, pwd: String) {
        auth.signIn(withEmail: email, password: pwd) { (result, error) in
            if error == nil {
                print("Succesfully logged in to Firebase \(result.debugDescription)")
            } else {
                print("Failed to log in \(error.debugDescription)")
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
        } catch let error {
            print("Error signing out \(error.localizedDescription)")
        }
    }
    
}

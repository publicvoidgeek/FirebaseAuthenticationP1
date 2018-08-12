//
//  ViewController.swift
//  FirebaseAuthentication
//
//  Created by sanamsuri on 12/08/18.
//  Copyright © 2018 sanamsuri. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var emailOu: UITextField!
    @IBOutlet weak var passwordOu: UITextField!
    
    
    
    // Variables
    
    
    
    // Constants
    let userDefault = UserDefaults.standard
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userDefault.bool(forKey: "usersignedin") {
            performSegue(withIdentifier: "Segue_To_Signin", sender: self)
        }
    }
    
    
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { ( result, error) in
            if error == nil {
                // User created
                print("User Created")
                // Sign in user
                self.signInUser(email: email, password: password)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func signInUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                // Signed in
                print("User Signed In")
                self.userDefault.set(true, forKey: "usersignedin")
                self.userDefault.synchronize()
                self.performSegue(withIdentifier: "Segue_To_Signin", sender: self)
            } else if (error?._code == AuthErrorCode.userNotFound.rawValue) {
                    self.createUser(email: email, password: password)
            } else {
                print(error)
                print(error?.localizedDescription)
            }
        }
    }
    
    
    
    
    // Actions
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        signInUser(email: emailOu.text!, password: passwordOu.text!)
        
    }
    
    
    
    


}


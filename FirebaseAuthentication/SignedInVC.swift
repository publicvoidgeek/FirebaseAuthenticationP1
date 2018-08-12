//
//  SignedInVC.swift
//  FirebaseAuthentication
//
//  Created by sanamsuri on 12/08/18.
//  Copyright © 2018 sanamsuri. All rights reserved.
//

import UIKit
import Firebase



class SignedInVC: UIViewController {
    
    
    // Outlets
    @IBOutlet weak var emailOu: UILabel!
    
    
    
    // Variables
    
    
    // Constants
    let userDefault = UserDefaults.standard
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let email = Auth.auth().currentUser?.email else { return }
        emailOu.text = email
    }
    
    
    
    //  Actions
    
    
    
    @IBAction func signOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            userDefault.removeObject(forKey: "usersignedin")
            userDefault.synchronize()
            self.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
    
}

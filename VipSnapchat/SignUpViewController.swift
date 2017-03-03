//
//  SignUpViewController.swift
//  VipSnapchat
//
//  Created by Apple on 3/3/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var LoginLabel: UILabel!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("I am trying to SignIn")
            if error != nil {
                print("we have error \(error)")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    if error != nil {
                        print("we have an error while creating \(error)")
                    } else {
                        print("created user sucessfully ")
                        self.performSegue(withIdentifier: "signedInSegue", sender: nil)

                    }
                })
            } else {
                print("Signed In sucessfully")
                self.performSegue(withIdentifier: "signedInSegue", sender: nil)
            }
        })
        
    }



}
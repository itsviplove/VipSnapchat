//
//  ViewController.swift
//  VipSnapchat
//
//  Created by Apple on 3/2/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet var LogInButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
        
        
        
        
    }

    
    
    @IBAction func logInTapped(_ sender: UIButton) {
        
        
        print("login tapped ")
        
        performSegue(withIdentifier: "signupSegue", sender: sender)

        
        
    }
        @IBAction func signUpTapped(_ sender: Any) {
        
        
        print("login tapped2 )")
        
        performSegue(withIdentifier: "signupSegue", sender: nil)
        
    }
    
    

}


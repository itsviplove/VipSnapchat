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

    @IBAction func logInTapped(_ sender: Any) {
        performSegue(withIdentifier: "signupSegue", sender: nil)

        
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "signupSegue", sender: nil)
        let labelChange = SignUpViewController()
        labelChange.labelChange()
        
        
    }
    
    

}


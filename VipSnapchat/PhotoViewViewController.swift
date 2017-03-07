//
//  PhotoViewViewController.swift
//  VipSnapchat
//
//  Created by Viplove MacOS on 3/7/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage


class PhotoViewViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var snap : snaps?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = snap!.decript
        photoView.sd_setImage(with: URL(string: snap!.imageURL))
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap!.key).removeValue()
        FIRStorage.storage().reference().child("images").child("\(snap!.imageuiud).jpeg").delete { (error) in
            if error != nil {
                print(error!)
            } else {
                print("image deleted")
            }
        }
    }

    

}

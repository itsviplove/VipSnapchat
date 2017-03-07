//
//  PhotoToSendViewController.swift
//  VipSnapchat
//
//  Created by Apple on 3/5/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit
import Firebase

class PhotoToSendViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    var users : [User] = []
    var imageURl = ""
    var descrip = ""
    var imageUiud = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            
            
            let user = User()
            user.email = ((snapshot.value as AnyObject)["email"] as? String)!
            user.uid = snapshot.key
            
            
            self.users.append(user)
            self.tableview.reloadData()
        })
        
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user2 = users[indexPath.row]
        cell.textLabel!.text = user2.email
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user2 = users[indexPath.row]
        
        
        let snap = ["from" : FIRAuth.auth()?.currentUser!.email!,"description" : descrip,"imageURL" : imageURl , "uiud" : imageUiud]
            FIRDatabase.database().reference().child("users").child(user2.uid).child("snaps").childByAutoId().setValue(snap)
        performSegue(withIdentifier: "sendingPicSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let nextVC = segue.destination as! SignedInViewController
        
        
    }
}

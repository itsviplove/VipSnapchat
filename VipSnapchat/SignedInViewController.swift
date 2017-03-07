//
//  SignedInViewController.swift
//  VipSnapchat
//
//  Created by Apple on 3/3/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit
import Firebase

class SignedInViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    var snap : [snaps] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            
            
            let user = snaps()
            user.imageURL = ((snapshot.value as AnyObject)["imageURL"] as? String)!
            user.from = ((snapshot.value as AnyObject)["from"] as? String)!
            user.decript = ((snapshot.value as AnyObject)["description"] as? String)!
            user.key = snapshot.key
            user.imageuiud = ((snapshot.value as AnyObject)["uiud"] as? String)!
            
            self.snap.append(user)
            self.tableView.reloadData()

    })
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childRemoved, with: {(snapshot) in
            
            var index = 0
            for snap2 in self.snap {
                if snap2.key == snapshot.key {
                    self.snap.remove(at: index)
                }
                index += 1
            }
            
            
            self.tableView.reloadData()
            
        })

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snap.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = snap[indexPath.row]
        cell.textLabel!.text = user.from
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = snap[indexPath.row]
        performSegue(withIdentifier: "photoViewSegue", sender: user)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "photoViewSegue" {
        let nextVC = segue.destination as! PhotoViewViewController
            nextVC.snap = sender as! snaps!
        }
    }
    
    
    
    
    
    @IBAction func LogedOutTapped(_ sender: Any) {
    }
    
}

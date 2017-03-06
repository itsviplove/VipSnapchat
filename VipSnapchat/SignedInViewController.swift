//
//  SignedInViewController.swift
//  VipSnapchat
//
//  Created by Apple on 3/3/17.
//  Copyright © 2017 itsviplove. All rights reserved.
//

import UIKit

class SignedInViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    var user3 : [User] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user3.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = user3[indexPath.row]
        cell.textLabel!.text = user.email
        return cell
    }
    
    
    
    
    
    
    
    @IBAction func LogedOutTapped(_ sender: Any) {
    }
    
}

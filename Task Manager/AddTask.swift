
//
//  ViewController.swift
//  Task Manager
//
//  Created by Mayah Alam on 11/29/18.
//  Copyright © 2018 Mayah Alam. All rights reserved.
//

import UIKit

class AddTask: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskTime: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 2
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 3
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }*/
    
}

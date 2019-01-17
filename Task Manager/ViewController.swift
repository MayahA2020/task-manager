//
//  ViewController.swift
//  Task Manager
//
//  Created by Mayah Alam on 11/8/18.
//  Copyright © 2018 Mayah Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UserDefaults.standard.array(forKey: "dailytasks"))!.count
    }
    
    let tasksProp = UserDefaults.standard.array(forKey: "dailytasks") as! [[String: Any]]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: defaultCell = self.taskTable.dequeueReusableCell(withIdentifier: "defaultCell") as! defaultCell!
        let task = AddTask.DailyTask.init(propertyList: self.tasksProp[indexPath.row])
        cell.taskNameLabel.text = task.name
        cell.timeLeftLabel.text = String(task.time)
        cell.timeLeft = task.time
        cell.timeformat()
        if task.taskCompleted {
            cell.progressButton.setBackgroundImage(UIImage(named: "checkBox"), for: UIControl.State.normal)
        } else {
            cell.progressButton.setBackgroundImage(UIImage(named: "checkBoxEmpty"), for: UIControl.State.normal)
        }
        return cell
    }
    

    @IBOutlet weak var taskTable: UITableView!
    @IBOutlet weak var startPauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTable.delegate = self
        taskTable.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func startPausePressed(_ sender: UIButton) {
        if startPauseButton.titleLabel!.text! == "Start" {
            startPauseButton.titleLabel!.text! = "Pause"
        } else {
            startPauseButton.titleLabel!.text! = "Start"
        }
        print(startPauseButton.titleLabel!.text!)
    }
    
    @IBAction func testerPrintArray(_ sender: Any) {
        print("")
        print(UserDefaults.standard.array(forKey: "dailytasks")?.count)
        print(UserDefaults.standard.array(forKey: "dailytasks"))
    }
    
    
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }*/
     // Configure the cell...

}


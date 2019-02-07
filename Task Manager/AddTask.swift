
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
    
    struct DailyTask {
        var name = ""
        var time = 0.0
        var taskCompleted = false
        
        init(name: String, time: Double, taskCompleted: Bool) {
            self.name = name
            self.time = time
            self.taskCompleted = taskCompleted
        }
        
        init(propertyList: [String: Any]) {
            self.name = propertyList["name"]! as! String
            self.time = propertyList["time"]! as! Double
            self.taskCompleted = propertyList["taskCompleted"]! as! Bool
        }
        
        func description() {
            print("Name: \(name)  Time: \(time)  Has this task been completed?: \(taskCompleted)")
        }
        
        func propertyListMethod() -> [String: Any] {
            return ["name" : name, "time" : time, "taskCompleted" : taskCompleted]
        }
    }
    
    var dailyTasks: [[String: Any]] = []

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Create a task object
        let name = taskName.text
        let time = taskTime.countDownDuration
        let newTask = DailyTask.init(name: name!, time: time, taskCompleted: false)
        print(taskTime)
        // Convert object to property list
        let newTaskProp = newTask.propertyListMethod()
        
        // Fetch existing tasks
        var oldList = UserDefaults.standard.array(forKey: "dailytasks") as? [[String: Any]]
        if oldList!.count == 0 {
            UserDefaults.standard.set([newTaskProp], forKey: "dailytasks")
        } else {
            oldList!.append(newTaskProp)
            UserDefaults.standard.set(oldList, forKey: "dailytasks")
        }
        
        var tasks = UserDefaults.standard.array(forKey: "dailytasks") as? [[String: Any]]
        print("Old List: \(tasks)")
        return true
    }
    
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

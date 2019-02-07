//
//  defaultCell.swift
//  Task Manager
//
//  Created by Mayah Alam on 12/20/18.
//  Copyright © 2018 Mayah Alam. All rights reserved.
//

import Foundation
import UIKit

class defaultCell: UITableViewCell {
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var progressButton: UIButton!
    
    var nameOfTask = ""
    var timeLeft: Double = 0
    var buttonImage: UIImage = UIImage(named: "checkBoxEmpty")!
    var color = UIColor.white
    
    init(nameOfTask: String, timeLeft: Double, buttonImage: UIImage, color: UIColor, nsCoder: NSCoder) {
        self.nameOfTask = nameOfTask
        self.timeLeft = timeLeft
        self.buttonImage = buttonImage
        self.color = color
        super.init(coder: nsCoder)!
        timeLeftLabel.text = timeformat()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func timeformat() -> String {
        let seconds = Int(timeLeft) % 60
        let minutes = Int(timeLeft) / 60 % 60
        let hours = Int(timeLeft) / (60 * 60) % 60
        print(String(format:"%02i:%02i:%02i", hours, minutes, seconds))
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
       
    }

}



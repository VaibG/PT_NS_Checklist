//
//  IPPTVC.swift
//  NS Checklist
//
//  Created by Vaibhav Gattani on 9/7/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit

class IPPTVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var age: UIButton!
    @IBOutlet weak var pushUps: UIButton!
    @IBOutlet weak var sitUps: UIButton!
    @IBOutlet weak var runTime: UIButton!
    @IBOutlet weak var rewardType: UILabel!
    @IBOutlet weak var pushUpScore: UILabel!
    @IBOutlet weak var sitUpScore: UILabel!
    @IBOutlet weak var runScore: UILabel!
    @IBOutlet weak var selectorView: UIPickerView!
    @IBOutlet weak var closePickerView: UIView!
    @IBOutlet weak var selectorViewHeight: NSLayoutConstraint!
    
    var pushUpData = [
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25],
[0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25],
[0,0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25],
[0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25],
[0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25],
[0,0,0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25],
[0,0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25],
[0,0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25],
[0,0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25],
[0,0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25],
[0,0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,21,21,21,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25],
[0,0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,21,21,21,22,22,22,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25],
[0,0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,21,21,21,22,22,22,23,23,23,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25],
[0,1,2,4,6,8,9,10,11,12,13,14,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,21,21,22,22,22,23,23,23,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25],
    ]
    
    var sitUpData = [
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25],
[0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25],
[0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25],
[0,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25],
[0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25],
[0,0,0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25],
[0,0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25],
[0,0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25],
[0,0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25],
[0,0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25],
[0,0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25],
[0,0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,21,21,21,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25],
[0,0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,21,21,21,22,22,22,23,23,23,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25],
[0,1,2,3,4,5,6,6,7,7,8,9,10,11,12,13,13,14,14,15,16,17,18,18,19,19,20,20,20,21,21,21,22,22,22,23,23,23,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25],
    ]
    var runTimeData = [
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50],
[0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50],
[0,0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50],
[0,0,0,0,0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50],
[0,0,0,0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50],
[0,0,0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50],
[0,0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50],
[0,0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50,50],
[0,0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50,50,50],
[0,0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50,50,50,50],
[0,0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50,50,50,50,50],
[0,0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50,50,50,50,50,50],
[0,1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50],
[1,2,4,6,8,10,12,14,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,35,36,36,37,37,38,38,39,40,41,42,43,44,45,46,47,48,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50],
]

    var runningTimes = ["18:20", "18:10", "18:00", "17:50", "17:40", "17:30", "17:20", "17:10", "17:00", "16:50", "16:40", "16:30", "16:20", "16:10", "16:00", "15:50", "15:40", "15:30", "15:20", "15:10", "15:00", "14:50", "14:40", "14:30", "14:20", "14:10", "14:00", "13:50", "13:40", "13:30", "13:20", "13:10", "13:00", "12:50", "12:40", "12:30", "12:20", "12:10", "12:00", "11:50", "11:40", "11:30", "11:20", "11:10", "11:00", "10:50", "10:40", "10:30", "10:20", "10:10", "10:00", "9:50", "9:40", "9:30", "9:20", "9:10", "9:00", "8:50", "8:40", "8:30"];

    var pushUpChoice = [String]()
    var sitUpChoice = [String]()
    var ageChoice = [String]()

    var current = [String]()
    var currentButton: UIButton!
    
    var pushUpPoints: Int = 0
    var sitUpPoints: Int = 0
    var runTimePoints: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        var x = 1
        while x <= 60 {
            pushUpChoice.append("\(x)")
            sitUpChoice.append("\(x)")
            if(x>16) {
                ageChoice.append("\(x)")
            }
            x+=1
        }
        currentButton = age
        selectorView.delegate = self
        selectorView.dataSource = self
        if(UIScreen.main.bounds.height < 570)
        {
           selectorViewHeight.constant = 100
            pushUps.titleLabel!.font = UIFont(name: "MarkerFelt-Thin", size: 16.0)
            runTime.titleLabel!.font = UIFont(name: "MarkerFelt-Thin", size: 16.0)!
        }

    
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return current.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return current[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentButton.setTitle(current[row], for: UIControlState.normal)
    }
    
    @IBAction func pushUpWillEnter(_ sender: UIButton!) {
        pushUpScore.isHidden = true
        sitUpScore.isHidden = true
        runScore.isHidden = true
        rewardType.isHidden = true
        current = pushUpChoice
        currentButton = pushUps
        selectorView.reloadAllComponents()
        selectorView.selectRow(39, inComponent: 0, animated: false)
        selectorView.isHidden = false
        closePickerView.isHidden = false
    }
    
    @IBAction func runTimeWillEnter(_ sender: UIButton!) {
        pushUpScore.isHidden = true
        sitUpScore.isHidden = true
        runScore.isHidden = true
        rewardType.isHidden = true
        current = runningTimes
        currentButton = runTime
        selectorView.reloadAllComponents()
        selectorView.selectRow(44, inComponent: 0, animated: false)
        selectorView.isHidden = false
        closePickerView.isHidden = false
    }
    @IBAction func ageWillEnter(_ sender: UIButton!) {
        pushUpScore.isHidden = true
        sitUpScore.isHidden = true
        runScore.isHidden = true
        rewardType.isHidden = true
        current = ageChoice
        currentButton = age
        selectorView.reloadAllComponents()
        selectorView.selectRow(4, inComponent: 0, animated: false)
        selectorView.isHidden = false
        closePickerView.isHidden = false
    }
    
    @IBAction func sitUpWillEnter(_ sender: UIButton!) {
        pushUpScore.isHidden = true
        sitUpScore.isHidden = true
        runScore.isHidden = true
        rewardType.isHidden = true
        current = sitUpChoice
        currentButton = sitUps
        selectorView.reloadAllComponents()
        selectorView.selectRow(39, inComponent: 0, animated: false)
        selectorView.isHidden = false
        closePickerView.isHidden = false
    }
    
    @IBAction func donePressed(_ sender: Any) {
        selectorView.isHidden = true
        closePickerView.isHidden = true
    }
    
    func getAgeCat() -> Int {
    var ageCat = 0
    if((Int(age.currentTitle!))!<22) {
        ageCat = 0
    }else if((Int(age.currentTitle!))!<=24){
        ageCat = 1
    }else if((Int(age.currentTitle!))!<=27){
        ageCat = 2
    }else if((Int(age.currentTitle!))!<=30){
        ageCat = 3
    }else if((Int(age.currentTitle!))!<=33){
        ageCat = 4
    }else if((Int(age.currentTitle!))!<=36){
        ageCat = 5
    }else if((Int(age.currentTitle!))!<=39){
        ageCat = 6
    }else if((Int(age.currentTitle!))!<=42){
        ageCat = 7
    }else if((Int(age.currentTitle!))!<=45){
        ageCat = 8
    }else if((Int(age.currentTitle!))!<=48){
        ageCat = 9
    }else if((Int(age.currentTitle!))!<=51){
        ageCat = 10
    }else if((Int(age.currentTitle!))!<=54){
        ageCat = 11
    }else if((Int(age.currentTitle!))!<=57){
        ageCat = 12
    }else if((Int(age.currentTitle!))!<=60){
        ageCat = 13
    }

    return ageCat
    }

    func rewardType(points: Int) -> String {
        if (points>=90) {
            return "(Commando Gold)"
        } else if (points>=85){
            return "(Gold)"
        }else if (points>=75){
            return "(Silver)"
        }else if (points>=61){
            return "(Pass)"
        }else if (points>=51){
            return " (Pass - NSMen)"
        }else {
            return " (Fail)"
        }
        
    }
    
    @IBAction func generateResults() {
        
        selectorView.isHidden = true
        closePickerView.isHidden = true
        if(pushUps.currentTitle != "Enter number of push ups" &&
        sitUps.currentTitle != "Enter number of sit ups" &&
        age.currentTitle != "Enter age" &&
        runTime.currentTitle != "Enter timing of your run") {
            let ageCat = getAgeCat()
            pushUpPoints = pushUpData[ageCat][Int(pushUps.currentTitle!)! - 1]
            sitUpPoints = sitUpData[ageCat][Int(sitUps.currentTitle!)! - 1]
            var x = 0
            var runIndex: Int = 0
            while x < 60 {
                if(runningTimes[x] == runTime.currentTitle!){
                    runIndex = x
                    break
                }else{
                    x += 1
                }
            }
            runTimePoints = runTimeData[ageCat][runIndex]
        
        pushUpScore.text = String(pushUpPoints)
        sitUpScore.text = String(sitUpPoints)
        runScore.text = String(runTimePoints)
        let IPPTPoints = pushUpPoints + sitUpPoints + runTimePoints
        let reward = rewardType(points: IPPTPoints)
        rewardType.font = UIFont(name: "MarkerFelt-Thin", size: 26.0)
        var newFrame = rewardType.frame
        newFrame.size.height = 30
        rewardType.frame = newFrame
        var str = ""
        str.append(String(IPPTPoints))
        str.append(" ")
        str.append(reward)
        rewardType.text = str
        
        pushUpScore.isHidden = false
        sitUpScore.isHidden = false
        runScore.isHidden = false
        rewardType.isHidden = false
        } else {
            rewardType.text = "Please ensure that you have entered all the information and try again!"
            rewardType.font = UIFont(name: "MarkerFelt-Thin", size: 16.0)
            rewardType.sizeToFit()
            rewardType.isHidden = false
        }

    }
}

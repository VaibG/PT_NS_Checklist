//
//  InfoVC.swift
//  BMT List
//
//  Created by Vaibhav Gattani on 27/5/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class InfoVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {


    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var myReminderPicker: UIPickerView!
    @IBOutlet weak var myReminderTime: UIButton!
    @IBOutlet weak var myBookinTime: UIButton!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var campInfo: UITextField!
    @IBOutlet weak var datePickerHeight: NSLayoutConstraint!
    @IBOutlet weak var labelsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var reminderPickerHeight: NSLayoutConstraint!
    
    let states = ["15 mins", "30 mins", "45 mins", "1 hour", "2 hours", "3 hours"]
    var text: [NSManagedObject] = []

    
    override func viewWillAppear(_ animated: Bool) {
        fetch()
        if(text.count != 0) {
            let item = text[0]
            campInfo.text = item.value(forKey: "camp") as? String
        } else {
            save(note: "")
        }
        
        if(UIScreen.main.bounds.height < 570)
        {
            datePickerHeight.constant = 100
            labelsHeightConstraint.constant = 100
            buttonsHeightConstraint.constant = 96
            reminderPickerHeight.constant = 90
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        update(note: campInfo.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDatePicker.minimumDate = NSDate() as Date
        myDatePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        campInfo.delegate = self

    }
    
    @IBAction func myBookinTimePressed(_sender: AnyObject) {
        myDatePicker.isHidden = false
        dateView.isHidden = false
    }
    
    @IBAction func donePressed(_ sender: Any) {
    
        dateView.isHidden = true
        myDatePicker.isHidden = true
        reminderView.isHidden = true
        myReminderPicker.isHidden = true
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        campInfo.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        campInfo.resignFirstResponder()
        return true
    }
    
    @IBAction func donePressedAgain(_ sender: Any) {
        donePressed(sender)
    }
    
    @IBAction func dateValueChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.string(from: myDatePicker.date)
        myBookinTime.setTitle(strDate, for: .normal)
    }
    
    @IBAction func myReminderTimePressed(_ sender: AnyObject) {
        myReminderPicker.dataSource = self
        myReminderPicker.delegate = self
        myReminderPicker.isHidden = false
        reminderView.isHidden = false
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myReminderTime.setTitle(states[row], for: UIControlState.normal)
    }
    
    func fetch() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Info")
        
        do {
            text = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    func save(note: String) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Info",
                                       in: managedContext)!
        
        let item = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        
        item.setValue(note, forKeyPath: "camp")
        
        do {
            text.append(item)
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func update(note: String) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        do {
            let item = try managedContext.existingObject(with: text[0].objectID)
            
            item.setValue(note, forKey: "camp")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
    }

    
    
    @IBAction func reminderActive(_ sender: Any) {
        
    }
    

    
    
}

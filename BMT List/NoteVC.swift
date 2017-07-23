//
//  NoteVC.swift
//  NS Checklist
//
//  Created by Vaibhav Gattani on 27/5/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NoteVC: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var noteTextView: UITextView!
    var text: [NSManagedObject] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetch()
        if(text.count != 0) {
        let item = text[0]
        noteTextView.text = item.value(forKey: "note") as? String
        } else {
            save(note: "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.font = UIFont(name: "Marker Felt", size: 17.0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)

        
        let ViewForDoneButtonOnKeyboard = UIToolbar()
        ViewForDoneButtonOnKeyboard.sizeToFit()
        let btnDoneOnKeyboard = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnFromKeyboardClicked))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil);
        ViewForDoneButtonOnKeyboard.items = [space, btnDoneOnKeyboard]
        noteTextView.inputAccessoryView = ViewForDoneButtonOnKeyboard
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        update(note: noteTextView.text)
    }
    
    func fetch() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "NotePad")
        
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
            NSEntityDescription.entity(forEntityName: "NotePad",
                                       in: managedContext)!
        
        let item = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        
        item.setValue(note, forKeyPath: "note")
        
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
    
            item.setValue(note, forKey: "note")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }


    }
    
    @IBAction func doneBtnFromKeyboardClicked (sender: Any) {
        self.view.endEditing(true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        noteTextView.resignFirstResponder()
    }
    
    public func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.bottomConstraint.constant = keyboardFrame.size.height
        })
    }
    
    public func keyboardWillHide(sender: NSNotification) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.bottomConstraint.constant = 30
        })    }
    
    
}

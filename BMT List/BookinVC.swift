//
//  BookinVC.swift
//  BMT List
//
//  Created by Vaibhav Gattani on 10/5/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import UIKit
import CoreData

class BookinItem: UITableViewCell {
    
 
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var listText: UILabel!
    @IBOutlet weak var labelWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        if(UIScreen.main.bounds.width<330){
            labelWidthConstraint.constant = 200
        }
    }
    
}

var list: [NSManagedObject] = []


class BookinVC: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var myBookinList: UITableView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var textFieldWidthConstraint: NSLayoutConstraint!
    
    let screenSize: CGRect = UIScreen.main.bounds
    

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "BookinList")
        
        do {
            list = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        myBookinList.reloadData()
        
        myBookinList.rowHeight = UITableViewAutomaticDimension
        myBookinList.estimatedRowHeight = 15
        
        if(screenSize.width<330){
            textFieldWidthConstraint.constant = 200
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.font = UIFont(name: "Marker Felt", size: 17.0)
        input.delegate = self
        
        let hasLaunchedKey = "HasLaunched"
        let defaults = UserDefaults.standard
        let hasLaunched = defaults.bool(forKey: hasLaunchedKey)
        
        if !hasLaunched {
            save(name: "Camp Pass", checked: false)
            save(name: "No. 4 Uniform", checked: false)
            save(name: "Admin Kit", checked: false)
            save(name: "PT Kit", checked: false)
            save(name: "Green Socks", checked: false)
            save(name: "White Socks", checked: false)
            save(name: "Underwear", checked: false)
            save(name: "Towel", checked: false)
            save(name: "Water Bottle", checked: false)
            save(name: "Jockey Cap", checked: false)
            save(name: "Rank/Formation Badge", checked: false)
            defaults.set(true, forKey: hasLaunchedKey)
        }
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myBookinList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookinItem
        let item = list[indexPath.row]
        cell.listText?.text = item.value(forKey: "name") as? String
        cell.listText.numberOfLines=0
        cell.listText.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.listText.sizeToFit()
        cell.listText.tag = indexPath.row
        cell.checkBox.layer.borderWidth = 2.0
        cell.checkBox.layer.borderColor = UIColor.black.cgColor
        cell.checkBox.tag = indexPath.row
        
        if(item.value(forKey: "checked") as! Bool) {
            cell.checkBox.setImage(#imageLiteral(resourceName: "big red tick"), for: .normal)
            cell.listText.alpha = 0.3
        } else {
            cell.checkBox.setImage(nil, for: .normal)
            cell.listText.alpha = 1
        }
        
        return cell

    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            managedContext.delete(list[indexPath.row])
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            list.remove(at: indexPath.row)
            myBookinList.reloadData()

        }
    }
    
    @IBAction func checkBoxTouched(_ sender: UIButton) {
    checkboxTouched(sender: sender)
    
    }
    
    func checkboxTouched(sender: UIButton!) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        var indexPath: NSIndexPath!
        
        if (sender.currentImage == nil) {
            sender.setImage(#imageLiteral(resourceName: "big red tick"), for: .normal)
            if let superview = sender.superview {
                if let cell = superview.superview as? BookinItem{
                indexPath = myBookinList.indexPath(for: cell) as NSIndexPath!
                    
                cell.listText.alpha = 0.3
                do {
                    let item = try managedContext.existingObject(with: list[indexPath.row].objectID)
                    item.setValue(true, forKey: "checked")
                        
                    } catch let error as NSError {
                        print("Could not check. \(error), \(error.userInfo)")
                    }

                list[indexPath.row].setValue(true, forKey: "checked")
                
                    }
                }
            
            }
    else {
            sender.setImage(nil, for: .normal)
            if let superview = sender.superview {
                if let cell = superview.superview as? BookinItem{
                    indexPath = myBookinList.indexPath(for: cell) as NSIndexPath!
                    
                    cell.listText.alpha = 1
                    do {
                        let item = try managedContext.existingObject(with: list[indexPath.row].objectID)
                        item.setValue(false, forKey: "checked")
                        
                    } catch let error as NSError {
                        print("Could not uncheck. \(error), \(error.userInfo)")
                    }

                    list[indexPath.row].setValue(false, forKey: "checked")
                }
            }
            
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
   
    }


    func textFieldDidEndEditing(_ textField: UITextField) {
        input.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }
    
    @IBAction func addItem(_ sender: Any) {
    
        if (input.text != "") {
        save(name: input.text!, checked: false)
        input.text=""
        myBookinList.reloadData()
        }
        
        input.resignFirstResponder()

    }
    
    func save(name: String, checked: Bool) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "BookinList",
                                       in: managedContext)!
        
        let item = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        item.setValue(name, forKeyPath: "name")
        item.setValue(checked, forKeyPath: "checked")
        
        do {
            try managedContext.save()
            list.append(item)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}

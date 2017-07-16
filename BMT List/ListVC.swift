//
//  ViewController.swift
//  BMT List
//
//  Created by Vaibhav Gattani on 14/4/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    
    var mustBring = [
    "NRIC",
    "Enlistment Notice",
    "All previous immunisation certificates and medical documents"]
    
    var shouldBring = [
    "Cheap Slippers",
    "Waterproof watch",
    "Wet tissues",
    "Permanent black marker (to label)",
    "2-3 Extra plastic bags for dirty laundry, misc. use",
    "Enough underwear for two weeks (at least 6)",
    "Clothes hangers (5 or more)",
    "Pegs (to dry clothes)",
    "All-in-one body soap/shampoo, facial foam",
    "Toothbrush and toothpaste",
    "At least $10 worth of 50c/$1 coins (for vending machines)",
    "Portable charger (around 20-30k mAH should be good enough)",
    "Extra toilet paper",
    "Your favorite snacks",
    "Detergent (powdered) and brush",
    "Febreeze",
    "Nail Clippers",
    "Spare pair of specs",
    "Alarm clock"]
    
    var optionalBring = ["Large can of prickly heat powder",
                         "Instant boot polish (kiwi)",
                         "Pain relieving spray",
                         "Pen for taking notes",
                         "Swimming goggles",
                         "Spare lock and key",
                         "Deoderant",
                         "Air freshener",
                         "Floor wipes",
                         "Plasters/panadol in case",
                         "Battery operated shaver/your own shaver",
                         "Books to read/UNO/Monopoly Deal"]
    
    
    var labels = [UILabel]()
    var buttons = [UIButton]()
    var contentHeight:CGFloat = 0.0
    var newY: CGFloat = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        newY = scroller.frame.minY - 120
        createList(someArray: mustBring, title: "Essential: ")
        createList(someArray: shouldBring, title: "Recommended: ")
        createList(someArray: optionalBring, title: "Optional: ")
        loadDefaults()

    }
    
    func createList(someArray: [String], title: String) {
        
        let scrollHeight = CGFloat(20)
        let header = UILabel()
        header.text = title
        header.font = UIFont(name: "MarkerFelt-Wide", size: 24.0)
        header.numberOfLines=0
        header.frame = CGRect(x: scroller.frame.minX, y: newY, width: 300, height: 800)
        header.sizeToFit()
        //header.backgroundColor = UIColor.blue
        scroller.addSubview(header)
        newY += header.frame.size.height + scrollHeight
        contentHeight = newY
        
        
        for x in 0...someArray.count-1 {
            let text = someArray[x]
            let label = UILabel()
            label.text = text
            label.font = UIFont(name: "Marker Felt", size: 16.0)
            //label.backgroundColor = UIColor.purple
            label.numberOfLines = 0
            
            
            let checkbox = UIButton()
            checkbox.layer.borderWidth = 2.0
            checkbox.layer.borderColor = UIColor.black.cgColor
            checkbox.addTarget(self, action: #selector(checkboxTouched), for: .touchUpInside)
            
            
            scroller.addSubview(label)
            scroller.addSubview(checkbox)
            if(UIScreen.main.bounds.width < 330) {
                label.frame = CGRect(x: scroller.frame.minX, y: newY, width: 190, height: 30)
            }
            else{
                label.frame = CGRect(x: scroller.frame.minX, y: newY, width: 230, height: 30)
            }
            label.sizeToFit()
            if(UIScreen.main.bounds.width < 330) {
                checkbox.frame = CGRect(x: scroller.frame.size.width - 100, y: label.frame.midY - 15, width: 30, height: 30)
            } else {
              checkbox.frame = CGRect(x: scroller.frame.size.width - 80, y: label.frame.midY - 15, width: 30, height: 30)
            }
            
            newY = newY + label.frame.size.height + scrollHeight
            contentHeight = newY + label.frame.size.height
            
            labels.append(label)
            buttons.append(checkbox)
            
        }
        
        if(UIScreen.main.bounds.width < 330) {
        scroller.contentSize =  CGSize(width: scroller.frame.size.width - 100, height: contentHeight)
        } else {
            scroller.contentSize =  CGSize(width: scroller.frame.size.width - 80, height: contentHeight)
        }
        
        newY += scrollHeight

    }
    
    public func checkboxTouched(sender: UIButton!) {
        
        if (sender.currentImage == nil) {
            sender.setImage(#imageLiteral(resourceName: "big red tick"), for: .normal)
            for x in 0 ... buttons.count - 1 {
                
                if sender == buttons[x] {
                    labels[x].alpha = 0.3
                    let defaults = UserDefaults.standard
                    defaults.set(true, forKey: String(x))
                    defaults.synchronize()
                }
            
            
            }
        
        }
        else {
            sender.setImage(nil, for: .normal)
            for x in 0 ... buttons.count - 1 {
                if sender == buttons[x] {
                    labels[x].alpha = 1
                    let defaults = UserDefaults.standard
                    defaults.set(false, forKey: String(x))
                    defaults.synchronize()
                }
            }
            
        }
        
    }
    
    func loadDefaults() {
        let defaults = UserDefaults.standard
        for x in 0...buttons.count-1 {
        
            if(defaults.bool(forKey: String(x))) {
            buttons[x].setImage(#imageLiteral(resourceName: "big red tick"), for: .normal)
            labels[x].alpha = 0.3
            }
           
        }
    
    }


}


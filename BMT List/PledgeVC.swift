//
//  PledgeVC.swift
//  BMT Checklist
//
//  Created by Vaibhav Gattani on 3/7/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit

class PledgeVC: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var seventhLabel: UILabel!

    let formattedString1 = NSMutableAttributedString()
    let formattedString2 = NSMutableAttributedString()
    let formattedString3 = NSMutableAttributedString()
    let formattedString4 = NSMutableAttributedString()


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        secondLabel.attributedText = formattedString1.normal("Do ").bold("solemnly ").normal("and ").bold("sincerely ").normal("pledge that:")
        
        
        thirdLabel.attributedText = formattedString2.normal("We will always bear true ").bold("faith ").normal("and ").bold("allegiance")
        

        fifthLabel.attributedText = formattedString3.normal("We will always ").bold("support ").normal("and ").bold("defend ").normal("the ").bold("Constitution;")
        

        sixthLabel.attributedText = formattedString4.normal("We will ").bold("preserve ").normal("and ").bold("protect ").normal("the ").bold("honour ").normal("and ").bold("independence ").normal("of our country")

    }
    
}
extension NSMutableAttributedString {
    @discardableResult func bold(_ text:String) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont(name: "MarkerFelt-Wide", size: 17.0)!]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        return self
    }
}

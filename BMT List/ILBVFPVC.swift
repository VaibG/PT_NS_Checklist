//
//  ILBV:FPVC.swift
//  NS Checklist
//
//  Created by Vaibhav Gattani on 17/6/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit

class ILBVFPVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollviewHeight: NSLayoutConstraint!
    @IBOutlet weak var imageviewHeight: NSLayoutConstraint!
    @IBOutlet weak var trailingPositioning: NSLayoutConstraint!
    @IBOutlet weak var leadingPositioning: NSLayoutConstraint!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(UIScreen.main.bounds.height < 560){
            
            scrollviewHeight.constant = 350
            imageviewHeight.constant = 350
            leadingPositioning.constant -= 75
            trailingPositioning.constant += 75
            
        }
        
        if(UIScreen.main.bounds.height == 568){
            
            scrollviewHeight.constant = 400
            imageviewHeight.constant = 400
            leadingPositioning.constant -= 45
            trailingPositioning.constant += 45
            
        }

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let size: CGSize = imageView.sizeThatFits((imageView.image?.size)!)
        let actualSize: CGSize = CGSize(width: (size.width * (imageView.frame.size.height/size.height)), height: imageView.frame.size.height)
        
        
        scrollView.contentSize = CGSize(width: actualSize.width, height: imageView.frame.size.height)
            
        
    }
    
    
}

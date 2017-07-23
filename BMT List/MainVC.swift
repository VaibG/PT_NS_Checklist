//
//  MainVC.swift
//  NS Checklist
//
//  Created by Vaibhav Gattani on 10/5/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var PageTitle: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var TopButton: UIButton!
    @IBOutlet weak var SecondButton: UIButton!
    @IBOutlet weak var ThirdButton: UIButton!
    @IBOutlet weak var FourthButton: UIButton!
    @IBOutlet weak var titleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var arrowImage: UIImageView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if(UIScreen.main.bounds.width < 370) {
            titleWidthConstraint.constant = 315
            
        }
        if(UIScreen.main.bounds.height < 570)
        {
            titleHeightConstraint.constant = 100
            arrowImage.isHidden = true
        }

        
        self.scroller.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        UIView.setAnimationsEnabled(false)
        PageTitle.text = "NS Checklist"
        Description.text = "An organizer tool for NSFs"
        TopButton.setTitle("Enlistment Checklist", for: .normal)
        SecondButton.setTitle("Book In Checklist", for: .normal)
        ThirdButton.setTitle("Information to Remember", for: .normal)
        FourthButton.setTitle("IPPT Calculator", for: .normal)
        
        self.scroller.contentSize = CGSize(width: self.view.frame.width * 2, height: self.view.frame.height)
        
        self.scroller.delegate = self
        self.pageControl.currentPage = 0
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){

        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        self.pageControl.currentPage = Int(currentPage);

        if Int(currentPage) == 0{
            PageTitle.text = "NS Checklist"
            Description.text = "An organizer tool for NSFs"
            TopButton.setTitle("Enlistment Checklist", for: .normal)
            SecondButton.setTitle("Book In Checklist", for: .normal)
            ThirdButton.setTitle("Information to Remember", for: .normal)
            FourthButton.setTitle("IPPT Calculator", for: .normal)
            arrowImage.transform = CGAffineTransform.identity
            
        }else if Int(currentPage) == 1{
            PageTitle.text = "NS Checklist"
            Description.text = "An organizer tool for NSFs"
            TopButton.setTitle("Rank System", for: .normal)
            SecondButton.setTitle("Drill Commands", for: .normal)
            ThirdButton.setTitle("ILBV/Field Pack List", for: .normal)
            FourthButton.setTitle("Notes", for: .normal)
            arrowImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)

            

    }
}
    
    @IBAction func FirstButtonClicked(_ sender: UIButton) {
        if (TopButton.currentTitle == "Enlistment Checklist"){
            performSegue(withIdentifier: "ListVC", sender: self)
        } else if (TopButton.currentTitle == "Rank System") {
            performSegue(withIdentifier: "RankVC", sender: self)
        }
    }
    
    @IBAction func SecondButtonClicked(_ sender: UIButton) {
    
        if (SecondButton.currentTitle == "Book In Checklist") {
            performSegue(withIdentifier: "BookinVC", sender: self)
        } else if (SecondButton.currentTitle == "Drill Commands"){
            performSegue(withIdentifier: "DrillVC", sender: self)
        }
    }
    
    @IBAction func ThirdButtonClicked(_ sender: UIButton) {
        
        if (ThirdButton.currentTitle == "Information to Remember") {
                performSegue(withIdentifier: "InfoVC", sender: self)
        } else if(ThirdButton.currentTitle == "ILBV/Field Pack List") {
            performSegue(withIdentifier: "ILBVFPVC", sender: self)
        }

}
    
    @IBAction func FourthButtonClicked(_ sender: UIButton) {
        if (FourthButton.currentTitle == "IPPT Calculator"){
            performSegue(withIdentifier: "IPPTVC", sender: self)
        } else if (FourthButton.currentTitle == "Notes") {
            performSegue(withIdentifier: "NoteVC", sender: self)
        }

    }
    
    @IBAction func unwindToMainVC(segue: UIStoryboardSegue) {
        
        
    }
    
}

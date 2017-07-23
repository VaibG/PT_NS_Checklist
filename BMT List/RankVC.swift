//
//  RankVC.swift
//  NS Checklist
//
//  Created by Vaibhav Gattani on 3/7/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit

class Rank: UITableViewCell {
    
    @IBOutlet weak var rankName: UILabel!
    @IBOutlet weak var rankAbb: UILabel!
    @IBOutlet weak var rankPic: UIImageView!
    
    override func awakeFromNib() {
        if(UIScreen.main.bounds.width == 320) {
        rankName.font = UIFont(name: "Marker Felt", size: 14.5)
        rankAbb.font = UIFont(name: "Marker Felt", size: 16.0)
        }
    }

    
}



class RankVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     @IBOutlet weak var myRankView: UITableView!
     @IBOutlet weak var descriptionLabel: UILabel!

    var abb = [
    "REC", "PTE", "LCP", "CPL", "CFC", "3SG", "2SG", "1SG", "SSG", "MSG", "3WO", "2WO", "1WO", "MWO", "SWO", "CWO", "2LT", "LTA", "CPT", "MAJ", "LTC", "SLTC", "COL", "BG", "MG", "LG"
    ]
    
    var name = [
    "Recruit", "Private", "Lance Corporal", "Corporal", "Corporal First Class", "3rd Sergeant", "2nd Sergeant", "1st Sergeant", "Staff Sergeant", "Master Sergeant", "3rd Warrant Officer", "2nd Warrant Officer", "1st Warrant Officer", "Master Warrant Officer", "Senior Warrant Officer", "Chief Warrant Officer", "2nd Lieutenant", "Lieutenant", "Captain", "Major", "Lieutenant Colonel", "Senior Lieutenant Colonel", "Colonel", "Brigadier General", "Major General", "Lieutenant General"]
    
    
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            myRankView.rowHeight = UITableViewAutomaticDimension
            myRankView.estimatedRowHeight = 25
            
            if(UIScreen.main.bounds.width == 320){
                descriptionLabel.font = UIFont(name: "MarkerFelt-Wide", size: 15.0)
            }
        }
    

    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = myRankView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Rank
            
            cell.rankPic.image = UIImage.init(named: abb[indexPath.row])
            
            cell.rankName.text = name[indexPath.row]
            
            cell.rankAbb.text = abb[indexPath.row]
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return name.count
        }
    }


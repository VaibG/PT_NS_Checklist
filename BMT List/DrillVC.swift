//
//  DrillVC.swift
//  BMT Checklist
//
//  Created by Vaibhav Gattani on 2/7/17.
//  Copyright © 2017 Vaibhav Gattani. All rights reserved.
//

import Foundation
import UIKit

class Drill: UITableViewCell {
    
    @IBOutlet weak var drillName: UILabel!
    @IBOutlet weak var drillMeaning: UILabel!
    
}


class DrillVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myDrillView: UITableView!
    
    var basicDrills = [
    "Basic Drills",
        
    "Sedi-a",
    "Senang di-ri",
    "Ke-kanan lu-rus",
    "Pandang kehadapan pan-dang",
    "Dari kanan bilang",
    "Diam",
    "Keluar-BARIS",
    
    "Turning Drills",
    
    "Ke-kiri pu-sing",
    "Ke-kanan pu-sing",
    "Keblakang pu-sing",
    "Begerak ke-kiri, Ke-kiri pu-sing",
    "Begerak ke-kanan, Ke-kanan pu-sing",
    "Akan Mengadap Ke-hadapan, Ke-kanan/kiri Pu-sing",
    
    "Marching Drills",
        
    "Dari kiri/kanan cepat jalan",
    "Berhen-Ti",
    "Impek kiri/kanan",
    "Dari kiri/kanan, kiri/kanan belok",
    "Hentak kaki, cepat hen-tak",
    
    "Weapon Drills",
    
    "Hormat senja-TA",
    "Julang senja-TA",
    "Rusok senja-TA",
    
    "Bearings Drills",

    "Dalam buka barisan ke-kanan lu-rus",
    "Dalam tutop barisan ke-kanan lu-rus",

    ]
    
    var englishMeaning = [
    "",
    "Stand at Attention. Elbows locked, eyes stare forward, chin up. No movement.",
    "Stand at Ease. Legs placed shoulder width apart, hands behind backs, right hand over left hand, fingers straightened. Eyes forward, looking up, no talking.",
    "Face to the right, align yourself",
    "Face the front (after kekanan lu-rus)",
    "Number off from the right",
    "Steady. To freeze at wherever you are",
    "Fall out",
    
    "",
    "Left Turn",
    "Right Turn",
    "About Turn",
    "Move to the left, left turn",
    "Move to the right, right turn",
    "Face the front, left/right turn (used at the end of a march)",
    
    "",
    "By the left/right, quick march",
    "Halt/Stop",
    "Keep left/right",
    "Wheel left/right",
    "Raise legs 90 degrees alternately without moving",
    
    "",
    "Present arms",
    "High port arms",
    "Low port arms/back to rest",
        
    "",
    "Open dressing",
    "Closed dressing",
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myDrillView.rowHeight = UITableViewAutomaticDimension
        myDrillView.estimatedRowHeight = 25
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myDrillView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Drill
        cell.drillName.text = basicDrills[indexPath.row]
        if(indexPath.row == 0 || indexPath.row == 8 || indexPath.row == 15 || indexPath.row == 21 || indexPath.row == 25){
            cell.drillName.font = UIFont(name: "MarkerFelt-Wide", size: 20.0)
        } else {
            cell.drillName.font = UIFont(name: "MarkerFelt-Thin", size: 17.0)
        }
        cell.drillMeaning.text = englishMeaning[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicDrills.count
    }
}

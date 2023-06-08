//
//  MatchDetailVC.swift
//  CricketInfo2
//
//  Created by K, Yogeshwari (Contractor) on 07/06/23.
//

import UIKit

class MatchDetailVC: UIViewController {

    @IBOutlet weak var teamL: UILabel!
    
    @IBOutlet weak var dateL: UILabel!
    
    @IBOutlet weak var matchtypeL: UILabel!
    
    @IBOutlet weak var venueL: UILabel!
    
    @IBOutlet weak var shortnL: UILabel!
    
    @IBOutlet weak var inningL: UILabel!
    
    @IBOutlet weak var runL: UILabel!
    
    @IBOutlet weak var wicL: UILabel!
    
    
    var match: MatchDetails?
    
    var scoresall: Scores?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let match = match {
            
            teamL.text = match.name
            dateL.text = match.date
            matchtypeL.text = match.matchType
            venueL.text = match.venue
            inningL.text = match.score[0].inning
            shortnL.text = match.teamInfo[0].shortname
            runL.text = String(match.score[1].r)
            wicL.text = String(match.score[2].w)
            
        }
    }
    

    
}

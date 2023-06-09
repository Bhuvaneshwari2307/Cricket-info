//
//  MatchDetailVC.swift
//  CricketInfo2
//
//  Created by K, Yogeshwari (Contractor) on 07/06/23.
//

import UIKit

class MatchDetailVC: UIViewController {

    @IBOutlet weak var team1L: UILabel!
    
    @IBOutlet weak var team2L: UILabel!
    
    @IBOutlet weak var dateL: UILabel!
    
    @IBOutlet weak var matchtypeL: UILabel!
    
    @IBOutlet weak var venueL: UILabel!
    
    @IBOutlet weak var shortn1L: UILabel!
    
    @IBOutlet weak var shortn2L: UILabel!
    

    
    @IBOutlet weak var inning1L: UILabel!
    
    @IBOutlet weak var inning2L: UILabel!
    
    @IBOutlet weak var run1L: UILabel!
    
    @IBOutlet weak var wic1L: UILabel!
    
    @IBOutlet weak var over1L: UILabel!
    
    @IBOutlet weak var run2L: UILabel!
    
    @IBOutlet weak var wic2L: UILabel!
    
    @IBOutlet weak var over2L: UILabel!
    
    @IBOutlet weak var startedL: UILabel!
    
    @IBOutlet weak var endedL: UILabel!
    
    
    @IBOutlet weak var nameL: UILabel!
    
    @IBOutlet weak var statusL: UILabel!
    

    
    
    
    
    var match: MatchDetails?
    

    var score: Scores?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let match = match {
            
            nameL.text = match.name
            //team1L.text = match.teamInfo[0].name
            //team2L.text = match.teamInfo[1].name
            shortn1L.text = match.teamInfo[0].shortname
            shortn2L.text = match.teamInfo[1].shortname
            dateL.text = match.date
            matchtypeL.text = match.matchType
            venueL.text = match.venue
            inning1L.text = match.score[0].inning
            run1L.text = String(match.score[0].r)
            wic1L.text = String(match.score[0].w)
            over1L.text = String(match.score[0].o)
            inning2L.text = match.score[1].inning
            run2L.text = String(match.score[1].r)
            wic2L.text = String(match.score[1].w)
            over2L.text = String(match.score[1].o)
            statusL.text = match.status
            startedL.text = String(match.matchStarted)
            endedL.text = String(match.matchEnded)

    
        }
        

    }
    

    
}

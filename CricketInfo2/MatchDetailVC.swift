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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let match = match {
            
            nameL.text = match.name
            
            if  match.teamInfo.count == 1
            {
                team1L.text = match.teamInfo[0].name
                shortn1L.text = match.teamInfo[0].shortname
                team2L.text = "Not Available"
                shortn2L.text = ""
                
            }
            
            else if match.teamInfo.count >=  2            {
                
                team1L.text = match.teamInfo[0].name
                shortn1L.text = match.teamInfo[0].shortname
                team2L.text = match.teamInfo[1].name
                shortn2L.text = match.teamInfo[1].shortname
      
            }
            else {
                team1L.text = "Not Available"
                shortn1L.text = ""
                team2L.text = "Not Available"
                shortn2L.text = ""
            }
                

            dateL.text = match.date
            matchtypeL.text = match.matchType
            venueL.text = match.venue

            statusL.text = match.status
            startedL.text = String(match.matchStarted)
            endedL.text = String(match.matchEnded)
            
            
            if  match.score.count == 1 {
                inning1L.text = match.score[0].inning
                run1L.text = String(match.score[0].r)
                wic1L.text = String(match.score[0].w)
                over1L.text = String(match.score[0].o)
                inning2L.text = "NA"
                run2L.text = "NA"
                wic2L.text = "NA"
                over2L.text = "NA"
                
                
            }
            
            else if match.score.count >= 2 {
                inning1L.text = match.score[0].inning
                run1L.text = String(match.score[0].r)
                wic1L.text = String(match.score[0].w)
                over1L.text = String(match.score[0].o)
                inning2L.text = match.score[1].inning
                run2L.text = String(match.score[1].r)
                wic2L.text = String(match.score[1].w)
                over2L.text = String(match.score[1].o)
                
            }
            else {
                inning1L.text = "NA"
                run1L.text = "NA"
                wic1L.text = "NA"
                over1L.text = "NA"
                inning2L.text = "NA"
                run2L.text = "NA"
                wic2L.text = "NA"
                over2L.text = "NA"
            }
            
            
            
//            CricketUtility.shared.downloadPoster(imageName: match.teamInfo.img) { url in
//                let imgData = try! Data(contentsOf: url)
//
//                self.img1.image = UIImage(data: imgData)
//            }

        }
        

    }
    
    
   
        

    
    

    
}

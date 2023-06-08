//
//  ViewController.swift
//  CricketInfo2
//
//  Created by K, Yogeshwari (Contractor) on 06/06/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tbl: UITableView!
    
    var matchList: [MatchDetails] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tbl.dataSource = self
        
        
        CricketUtility.shared.getCurrentMatches { matchResult in
            self.matchList = matchResult
            
            DispatchQueue.main.sync {
                self.tbl.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchCell
        
        let match = matchList[indexPath.row]
        
        cell.nameL.text = "\(match.name)"
        cell.matchL.text = "\(match.matchType)"
        cell.statusL.text = "\(match.status)"
        cell.dateL.text = "\(match.date)"
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMatch = matchList[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as! MatchDetailVC
        
        show(vc, sender: self)
    }
}

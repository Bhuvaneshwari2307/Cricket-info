//
//  ViewController.swift
//  CricketInfo2
//
//  Created by K, Yogeshwari (Contractor) on 06/06/23.
//

import UIKit
import Network

class ViewController: UIViewController {

    
    @IBOutlet weak var progressV: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var tbl: UITableView!
    
    let vModel = MatchViewModel()
    
    var matchList: [MatchDetails] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        downloadJSON {
            self.tbl.reloadData()
            print("Success")
        }
        
        tbl.dataSource = self
        tbl.delegate = self
        
        print(NSHomeDirectory())
        
        tbl.backgroundColor = .clear
        
    
        
    }
    
    func downloadJSON(completed: @escaping () ->()) {
        let url = URL(string: "https://g.cricapi.com/iapi/")
        
        URLSession.shared.dataTask(with: url!) { data, resoponse, err in
            if err == nil {
                do {
                    self.matchList = try JSONDecoder().decode([MatchDetails].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("error fetching data")
                }
                
                
            }
        }.resume()
    }

    override func viewWillAppear(_ animated: Bool) {
        if !vModel.isConnected{
            
            self.progressV.isHidden = false
            progressV.startAnimating()
            
            tbl.isHidden = true
            let settingUrl = UIApplication.openSettingsURLString
            
            UIApplication.shared.open(URL(string: settingUrl)!)
        }
        else {
            tbl.isHidden = false
            vModel.getMatches { matchResult in
                
                self.matchList = matchResult
                
                DispatchQueue.main.sync {
                    self.progressV.stopAnimating()
                    self.progressV.isHidden = true
                    //self.searchedData = self.matchList

                    self.tbl.reloadData()
                }
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
        cell.matchL.text = match.matchType
        cell.statusL.text = "\(match.status)"
        cell.dateL.text = "\(match.date)"
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMatch = matchList[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as! MatchDetailVC
        vc.match = selectedMatch
        
        show(vc, sender: self)
      
    }
}

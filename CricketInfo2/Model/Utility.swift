//
//  Utility.swift
//  CricketInfo2
//
//  Created by K, Yogeshwari (Contractor) on 06/06/23.
//

import Foundation

struct MatchDetails: Codable {
    var id: String
    var name: String
    var matchType: String
    var status: String
    var venue: String
    var date: String
    var dateTimeGMT: String
    var teams: [String]
    var teamInfo: [Name]
    var score: [Scores]
    var matchStarted: Bool
    var matchEnded: Bool
    

}


struct Name: Codable {
    var name: String
    var shortname: String
    
//    var name: String
//    var shortname: String
}

struct Scores: Codable {
    
    var r: Double
    var w: Double
    var o: Double
    var inning: String
}

struct MatchResult: Codable {
    var data: [MatchDetails]
    var status: String
    
}


struct CricketUtility {
    let apiKey = "cfd1564b-3165-4c91-8240-e2f38e22931f"
    let cricketurl = "https://api.cricapi.com/v1/"
    
    static var shared = CricketUtility()
    
    private init() {
        
    }
    
    let session = URLSession.shared

    
    func getCurrentMatches(handler: @escaping ([MatchDetails]) -> Void) {
        
        let currentUrl = "\(cricketurl)currentMatches?apikey=\(apiKey)"
        
        if let currentmatchURL = URL(string: currentUrl) {
            
            // 1. create session
            
            let session = URLSession.shared
            
            // 2. create request
            
           
            // 3. create task and resume
            
            let task = session.dataTask(with: currentmatchURL) { currentData, resp, err in
                
                //1. check err
                
                if err == nil {
                    //2. HTTP Status
                    if let sCode = (resp as? HTTPURLResponse)?.statusCode {
                        switch sCode {
                            
                            case 200...299 :
                            
                            print("Success \(sCode)")
                            let matchList = parseData(cData: currentData)
                            handler(matchList)
                            
                        default:
                            
                            print("Failed \(sCode)")
                            
                        }
          
                    }
 
                }
                
                else {
                    
                    print("Request Failed: Network Problem")
                    
                }
                
            }
            task.resume()

        }
        
        else {
            
            print("Something is wrong")
        }
        
    }
    
    func parseData(cData: Data?) -> [MatchDetails]{
        guard let currentData = cData else {
            print("Data is not available")
            return []
        }
        
        print("Going to parse data")
        
        do {
            let matchResult = try JSONDecoder().decode(MatchResult.self, from: currentData)
            print("Got :\(matchResult.data.count) matches")
            return matchResult.data
        }catch {
            print("Decoding error: \(error.localizedDescription)")
        }
        
        return []
    }
    
}


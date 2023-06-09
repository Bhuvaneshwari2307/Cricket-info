//
//  MatchViewModel.swift
//  CricketInfo2
//
//  Created by K, Yogeshwari (Contractor) on 09/06/23.
//

import Foundation

import Network

class MatchViewModel {
    
    let monitor = NWPathMonitor()
    
    var isConnected = false
    
    init() {
        
        monitor.pathUpdateHandler = { nwPath in
            switch nwPath.status{
            case .satisfied:
                print("Connection available")
                self.isConnected = true
            case .unsatisfied:
                print("No Connection")
                self.isConnected = false
            case .requiresConnection:
                print("Connecting...")
                self.isConnected = false
            default:
                break
            }
        }
        
        monitor.start(queue: DispatchQueue(label: "myqueue"))
        
    }
    
    // reference to Model, no reference of View
    
    let matchModel = CricketUtility.shared
    
    func getMatches(callback: @escaping ([MatchDetails]) -> Void)  {
        
        if isConnected {
            matchModel.getCurrentMatches(handler: callback)
            // save movie data to CoreData
        }
        else {
            // get list from CoreData
        }
    }

}


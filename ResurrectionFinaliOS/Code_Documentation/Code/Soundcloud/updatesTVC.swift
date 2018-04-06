//
//  updatesTVC.swift
//  Resurrection Church
//
//  Created by nahberry on 10/20/15.

import UIKit
import TwitterKit
import Fabric

class updatesTVC: TWTRTimelineViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "resurrectionwv", apiClient: client)
        
    }
    
}

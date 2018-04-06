//
//  mainViewController.swift
//  Resurrection Church
//
//  Created by Nate Hess on 3/7/18.
//  Copyright © 2018 Resurrection Church. All rights reserved.
//

import UIKit
import FirebaseDatabase

class mainViewController: UIViewController {
    @IBOutlet weak var listenButton: UIButton!
    @IBOutlet weak var currentSeriesArtwork: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func listenAction(_ sender: Any) {
        
        if let url = URL(string: "https://itunes.apple.com/us/podcast/resurrection-church-sermons/id1356300893?mt=2") {
            UIApplication.shared.openURL(url)
        }

    }
    
}

//
//  giveVC.swift
//  Resurrection Church
//
//  Created by Nate Hess on 4/10/18.
//  Copyright © 2018 Resurrection Church. All rights reserved.
//

import UIKit

class giveVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func openLink(_ sender: Any) {
        
        if let url = URL(string: "https://resurrectionwv.churchcenter.com/giving"){
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

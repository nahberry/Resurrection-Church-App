//
//  seriesWVC.swift
//  Resurrection Church
//
//  Created by Nate Hess on 4/10/18.
//  Copyright © 2018 Resurrection Church. All rights reserved.
//

import UIKit
import WebKit

class seriesWVC: UIViewController {
    @IBOutlet weak var seriesWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //Remember to check for network connection when the html file is hosted.
        
        //load the web view
        self.loadWebView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebView(){
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        seriesWebView.load(request)
        
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

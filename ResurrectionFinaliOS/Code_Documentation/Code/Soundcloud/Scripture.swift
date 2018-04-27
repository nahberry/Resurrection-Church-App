//
//  Scripture.swift
//  Resurrection Church
//
//  Created by Nate Hess on 4/20/18.
//  Copyright © 2018 Resurrection Church. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Scripture: UITableViewController {
    
    
    @IBOutlet weak var scriptureText: UITextView!
    @IBOutlet weak var scriptureHeading: UILabel!
    
    //Add database reference to Firebase
    var ref:DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        
        getFirebaseData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    func getFirebaseData(){
        let ref = Database.database().reference()
        
        // create an observe method to check for updates
        ref.observe(.value, with: { snapshot in print(snapshot.value!)
            print(snapshot.value!)
            
            //get a snapshot of the data and create a dictionary
            let webster = snapshot.childSnapshot(forPath: "Scripture")
            print(webster)
            
            // get individual snapshots of the data
            let titleData = webster.childSnapshot(forPath: "title")
            let textData = webster.childSnapshot(forPath: "text")
            
            //set the data to a variable
            let title = titleData.value as! String
            let text = textData.value as! String
            
            //output to console
            print(title)
            print(text)
            
            //set UILabel to the data retreived
            self.scriptureHeading.text = title
            self.scriptureText.text = text
            
        })
    }

}

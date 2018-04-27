//
//  ErrorHandling.swift
//  Resurrection Church
//
//  Created by Nate Hess on 4/25/18.
//  Copyright © 2018 Resurrection Church. All rights reserved.
//

import Foundation
import UIKit


class Errors: NSObject {
    
    func showNetworkAlert(){
        
        let networkAlert = UIAlertController(title: "Oh No! ):", message: "Please connect to a network!", preferredStyle: .alert)
        
        networkAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
    }
    
    func showEmailAlert(){
        
        let emailAlert = UIAlertController(title: "Oops!", message: "Please enter a valid email address", preferredStyle: .alert)
        
        emailAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
    
    }
    
    func showNameAlert(){
        
        let nameAlert = UIAlertController(title: "Oops!", message: "Please enter a name!", preferredStyle: .alert)
        
        nameAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        
    }
    
}



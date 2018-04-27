//
//  connectVC.swift
//  Resurrection Church
//
//  Created by Nate Hess on 4/6/18.
//  Copyright © 2018 Resurrection Church. All rights reserved.
//

import UIKit
import MessageUI
import FirebaseDatabase

class connectVC: UITableViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var messageField: UITextView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    //Add Firebase Reference
    var ref : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create Send Button
        sendButton.backgroundColor = UIColor.clear
        sendButton.layer.cornerRadius = 25
        sendButton.layer.borderWidth = 1
        sendButton.layer.borderWidth = 1
        
        //Set up the message field
        messageField.text = "M E S S A G E"
        messageField.textColor = UIColor.lightGray
        // Set the message field placeholder text (still trying to figure this one out)
        if messageField.text.isEmpty{
            messageField.text = "M E S S A G E: "
            messageField.textColor = UIColor.lightGray
        } else {
            if self.view.window != nil{
                if messageField.text != nil {
                    messageField.selectedTextRange = messageField.textRange(from: messageField.beginningOfDocument, to: messageField.endOfDocument)
                    
                    messageField.text = nil
                    messageField.textColor = UIColor.black
                }
            }
        }
        
        
        //disable the tablView selection
        tableView.allowsSelection = false
        
        //Create a toolbar and add a "done" button to it
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        //create left side empty space so that done button is on the right
        let flexSpace = UIBarButtonItem(barButtonSystemItem:
            .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(connectVC.doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        //setting toolbar as inputAccessoryView
        self.nameField.inputAccessoryView = toolbar
        self.emailField.inputAccessoryView = toolbar
        self.phoneField.inputAccessoryView = toolbar
        self.messageField.inputAccessoryView = toolbar
        
    }
    @objc func doneButtonAction(){
        self.view.endEditing(true)
    }
    
    
    
    //Firebase Send Data Function
    func sendData(){
        
        let name = nameField.text!
        let email = emailField.text!
        let phone = phoneField.text!
        let message = messageField.text!
        
        let post : [String : String] = ["name" : name,
                                           "email" : email,
                                           "phone" : phone,
                                           "message" : message]
        
        let dataReference = Database.database().reference().child("posts")
        dataReference.child("Messages").childByAutoId().setValue(post)
        
    }
    
    //Send button was pressed
    @IBAction func sendAction(_ sender: Any) {
        
        //Call the function to send data to Firebase
        sendData()
        print("Sent!")
        
        //Create a blur effect for the alert popup
        let blurEffect = UIBlurEffect(style: .light)
        let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurVisualEffectView.frame = view.bounds
        
        //Create the alert popup
        let sentAlert = UIAlertController(title: "Sent!", message: "Someone will be in touch with you soon.", preferredStyle: .alert)
        sentAlert.addAction(UIAlertAction(title: "close", style: .default, handler: { (action: UIAlertAction!) in print("closed view")
            blurVisualEffectView.removeFromSuperview()
        }))
        self.view.addSubview(blurVisualEffectView)
        self.present(sentAlert, animated: true)
        
        //Set text fields back to default placeholders
        self.nameField.text = ""
        self.emailField.text = ""
        self.phoneField.text = ""
        self.messageField.text = "M E S S A G E: "
        self.messageField.textColor = UIColor.lightGray
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Reposition window with keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
}

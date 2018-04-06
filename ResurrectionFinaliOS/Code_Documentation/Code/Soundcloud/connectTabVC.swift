//
//  connectTabVC.swift
//  
//
//  Created by nahberry on 6/1/17.
//
//

import UIKit
import MessageUI
import Foundation

class connectTabVC: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet var nameEntry: UITextField!
    @IBOutlet var phoneEntry: UITextField!
    @IBOutlet var commentsEntry: UITextView!
    @IBOutlet var send: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        
        nameEntry.delegate = self
        commentsEntry.delegate = self
       
        //Dark Keyboard
        nameEntry.keyboardAppearance = UIKeyboardAppearance.dark
        commentsEntry.keyboardAppearance = UIKeyboardAppearance.dark
        
    }
    
    //Send Mail
    @IBAction func sendMail(_ sender: Any) {
        let picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        if MFMailComposeViewController.canSendMail(){
            self.present(picker, animated: true, completion: nil)
            picker.setToRecipients(["hello@resurrectionwv.com"])
            picker.setSubject("Hello! From: " + nameEntry.text!)
            picker.setMessageBody(commentsEntry.text!, isHTML: true)
        }
        else{
            self.showSendMailErrorAlert()
        }
    }
    
    //Mail send failed alert
    func showSendMailErrorAlert() {
        _ = UIAlertView(title: "Could Not Send Email", message: "Email could not be send ): We apologize. Feel free to write us at hello@resurrectionwv.com through your email app of choice. Thanks for reaching out!", delegate: self, cancelButtonTitle: "OK")
    }
    
    //Controller setup
    @objc(mailComposeController:didFinishWithResult:error:) func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
   
}


    




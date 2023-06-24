//
//  ContactUsViewController.swift
//  Amoozesh
//
//  Created by Zakia Maryam Najafizada on 6/21/23.
//

import UIKit
import MessageUI

class ContactUsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        
    }
    func setupBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = .systemMint
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    @objc func backButtonPressed() {
        navigationController?.dismiss(animated: true)
        
    }
    
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.facebook.com/profile.php?id=100093731447526") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func instagramButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.instagram.com/amoozesh.app.information/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func twitterButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://twitter.com/AmoozeshApp") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        
        if MFMailComposeViewController.canSendMail() {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self

        composeVC.setToRecipients(["Amoozesh.info@gmail.com"])
        composeVC.setSubject("Email Subject")
        composeVC.setMessageBody("", isHTML: false)

        self.present(composeVC, animated: true, completion: nil)

        } else {

            print("Cannot send mail")

        }
    }
    }
    


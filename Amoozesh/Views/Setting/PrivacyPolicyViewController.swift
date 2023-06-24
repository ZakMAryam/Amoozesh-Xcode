//
//  PrivacyPolicyViewController.swift
//  Amoozesh
//
//  Created by Zakia Maryam Najafizada on 6/21/23.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
  
    }
    
    @IBAction func privacyPolicyButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/8bf9ef9f-237b-422b-8f26-7a1406e1251e") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
        
}



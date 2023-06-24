//
//  AboutUsViewController.swift
//  iLearn
//
//  Created by Zakia Maryam Najafizada on 6/21/23.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
  
    }
    func setupBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = .systemYellow
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    @objc func backButtonPressed() {
        navigationController?.dismiss(animated: true)
     
    }
    

}

//
//  OnboardingCollectionViewCell.swift
//  ILearn
//
//  Created by Zakia Maryam Najafizada on 6/4/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideMeaningLabel: UILabel!
    
    func setup(_ slide: Onboardingslide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideMeaningLabel.text = slide.description
    }
    
}

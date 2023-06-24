//
//  UIView+Extension.swift
//  ILearn
//
//  Created by Zakia Maryam Najafizada on 6/4/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
}

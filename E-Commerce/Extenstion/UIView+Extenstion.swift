//
//  UIView+Extenstion.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import UIKit


extension UIView {
    
    func setDefaultShadow(){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    func setCornerRadius(r: CGFloat){
        layer.cornerRadius = r
    }
    
}

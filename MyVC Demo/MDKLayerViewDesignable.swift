//
//  MDKLayerViewDesignable.swift
//  MyVC Demo
//
//  Created by Taun Chapman on 09/12/17.
//  Copyright © 2017 MOEDAE. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class MDKLayerViewDesignable : UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    @IBInspectable var masktToBounds:Bool = false
    @IBInspectable var margin:CGFloat = 0
    @IBInspectable var cornerRadius:CGFloat = 0
    @IBInspectable var borderWidth:CGFloat = 0
    @IBInspectable var borderColor:UIColor?
    @IBInspectable var shadowOffset:CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowColor:UIColor?
    @IBInspectable var shadowOpacity:Float = 0
    @IBInspectable var shadowRadius:CGFloat = 0
    
    @IBInspectable var gradientStartColor:UIColor?
    @IBInspectable var gradientStopColor:UIColor?
    
    override func prepareForInterfaceBuilder() {
        updateLayerProperties()
        setNeedsDisplay()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        
        if let layer = self.layer as? CAGradientLayer,
            let startColor = gradientStartColor,
            let stopColor = gradientStopColor {
            
            layer.colors = [startColor.cgColor, stopColor.cgColor]
        }
        
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
        }
        
        if let shadowColor = shadowColor {
            layer.shadowColor = shadowColor.cgColor
        }
        
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = masktToBounds
        
        
    }
    
}

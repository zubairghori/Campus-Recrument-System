//
//  TTextField.swift
//  Treat
//
//  Created by Admin on 16/08/2016.
//  Copyright © 2016 Treat. All rights reserved.
//

import UIKit

@IBDesignable class TTextField: UITextField {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var line = UIBezierPath()
    override func draw(_ rect: CGRect) {
       
        line = UIBezierPath(rect: CGRect(x:0, y:rect.height-1, width:rect.width, height:1))
        lineColor.setFill()
        line.fill()
        
        
    }
    
    @IBInspectable var lineColor: UIColor = UIColor(red:1,green: 1,blue: 1,alpha: 0.5) {
        didSet {
            self.backgroundColor = UIColor.clear
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var placeholerColor: UIColor = UIColor(red:1,green: 1,blue: 1,alpha: 0.5) {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder!,attributes:[NSForegroundColorAttributeName: placeholerColor])
        }
    }
    
}

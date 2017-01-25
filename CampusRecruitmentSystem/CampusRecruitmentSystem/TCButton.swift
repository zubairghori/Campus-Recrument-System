//
//  TCButton.swift
//  Treat
//
//  Created by Admin on 29/12/2016.
//  Copyright © 2016 Treat. All rights reserved.
//

import UIKit

@IBDesignable class TCButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.borderColor = BorderColor.cgColor
    }
    @IBInspectable var BorderColor: UIColor = UIColor.red {
        didSet {
            self.backgroundColor = UIColor.clear
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var BorderWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = BorderWidth
            self.setNeedsDisplay()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

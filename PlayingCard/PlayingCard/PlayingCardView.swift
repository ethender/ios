//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by BA on 05/08/19.
//  Copyright © 2019 BA. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {

    
    private func centeredAttributedString(_ string: String, fontSize: CGFloat)-> NSAttributedString{
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [NSAttributedString.Key.paragraphStyle:paragraphStyle,.font:font])
    }
   
    override func draw(_ rect: CGRect) {
    /*    if let context = UIGraphicsGetCurrentContext(){
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            context.setLineWidth(5.0)
            UIColor.green.setFill()
            UIColor.red.setStroke()
            context.strokePath()
            context.fillPath()
        }*/
        
        /*let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.lineWidth = 5.0
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.stroke()
        path.fill()*/
        
        let roundRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        // every drawing should be this roundrect
        roundRect.addClip()
        UIColor.white.setFill()
        roundRect.fill()
        
    }
    

}

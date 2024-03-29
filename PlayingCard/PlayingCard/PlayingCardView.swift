//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by BA on 05/08/19.
//  Copyright © 2019 BA. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {

    var rank: Int = 11 {didSet{setNeedsDisplay();setNeedsLayout()}}
    var suit: String = "❤️"{didSet{setNeedsDisplay();setNeedsLayout()}}
    var  isFaceUp: Bool = true{didSet{setNeedsDisplay();setNeedsLayout()}}
    private func centeredAttributedString(_ string: String, fontSize: CGFloat)-> NSAttributedString{
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [NSAttributedString.Key.paragraphStyle:paragraphStyle,.font:font])
    }
    
    
    private var cornerString: NSAttributedString {
        return centeredAttributedString(rankString+"\n"+suit, fontSize: cornerFontSize)
    }
    
    private lazy var upperLeftCornerLabel = createCornerLabel()
    private lazy var lowerRightCornerLabel = createCornerLabel()
    
    
    private func createCornerLabel()-> UILabel{
        let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
    
    private func configureCornerLabel(_ label: UILabel){
        label.attributedText = cornerString
        //	label.frame.size = CGSize.zero
        label.sizeToFit()
        label.isHidden = !isFaceUp
    }
    // this is called UI bounds changed and accessibility changed
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    
    // Add ing sub layouts
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCornerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
        configureCornerLabel(lowerRightCornerLabel)
        lowerRightCornerLabel.transform =  CGAffineTransform.identity
        .translatedBy(x: lowerRightCornerLabel.frame.size.width, y: lowerRightCornerLabel.frame.size.height)
        .rotated(by: CGFloat.pi)
        lowerRightCornerLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY)
        .offsetBy(dx: -cornerOffset, dy: -cornerOffset)
        .offsetBy(dx: -lowerRightCornerLabel.frame.size.width, dy: -lowerRightCornerLabel.frame.size.height	)
    }
   
    
    //drawing sub views
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
        
        let roundRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        // every drawing should be this roundrect
        roundRect.addClip()
        UIColor.white.setFill()
        roundRect.fill()
        
        if let faceCardImage = UIImage(named: rankString+suit){
            faceCardImage.draw(in: bounds.zoom(by: SizeRatio.faceCardImageSizeToBoundsSize))
        }
        
    }
    

}
extension PlayingCardView{
    private struct SizeRatio{
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsheight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    
    private var cornerRadius: CGFloat{
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsheight
    }
    private var cornerOffset: CGFloat{
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    private var cornerFontSize: CGFloat{
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
    
    private var rankString: String {
        switch rank{
        case 1: return "A"
        case 2...10: return String(rank)
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default: return "?"
        }
    }
    
}
extension CGRect{
    var leftHalf: CGRect{
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    
    var rightHalf: CGRect{
        return CGRect(x: midX, y: minY, width: width/2, height: height)
    }
    
    func inset(by size:CGSize)->CGRect{
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func sized(to size: CGSize)->CGRect{
        return CGRect(origin: origin, size: size)
    }
    
    func zoom(by scale: CGFloat)-> CGRect{
        let newWidth = width * scale
        let newHeight = height*scale
        return insetBy(dx: (width - newWidth)/2, dy: (height - newHeight)/2)
    }
}


extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat)->CGPoint{
        return CGPoint(x: x+dx, y: y+dy)
    }
}

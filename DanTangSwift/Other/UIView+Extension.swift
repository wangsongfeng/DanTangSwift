//
//  UIView+Extension.swift
//  DanTangSwift
//
//  Created by apple on 2017/9/29.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

extension UIView {
    
    func clipRectCorner(direction : UIRectCorner, cornerRadius : CGFloat)  {
        let  cornerSize = CGSize(width:cornerRadius, height:cornerRadius)
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame=bounds
        maskLayer.path=maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask=maskLayer
    }
    
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame : CGRect = frame
            tempFrame.origin.x = newValue
            frame=tempFrame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame=tempFrame
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            var tempFrame: CGRect = frame
            tempFrame.size.width=newValue
            frame = tempFrame
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.size.height=newValue
            frame=tempFrame
            
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            var tempFrame:CGRect = frame
            tempFrame.size=newValue
            frame = tempFrame
        }
    }
    
    var centerX:CGFloat {
        get{
            return center.x
        }
        set{
            var tempCenter:CGPoint = center
            tempCenter.x=newValue
            center=tempCenter
        }
        
    }
    
    var centerY:CGFloat {
        get{
            return center.y
        }
        set{
            var tempCenter:CGPoint = center
            tempCenter.y = newValue
            center = tempCenter
        }
    }
    
    
}

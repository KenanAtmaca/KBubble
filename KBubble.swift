
//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//  Copyright © 2017 Kenan Atmaca. All rights reserved.
//

import UIKit

class KBubble {
    
    private static let color:UIColor = UIColor(red: 75/255, green: 160/255, blue: 235/255, alpha: 1)
    
    private class func addOval(to view:UIView) -> CAShapeLayer {
        
        let rect = CGRect(x: 100, y: 100, width: 0, height: 0)
        
        let path = UIBezierPath(ovalIn: rect)
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
   
        return shape
    }
    
    private class func addAnimation(to shape:CAShapeLayer) -> CAAnimationGroup {
        
        let newRect = CGRect(x: 100, y: 100, width: 120, height: 120)
        let newPath = UIBezierPath(ovalIn: newRect)
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = newPath.cgPath
        animation.duration = 1

        
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.fromValue = 1
        animationOpacity.toValue = 0
        animationOpacity.duration = 1
      
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation,animationOpacity]
        groupAnimation.duration = 2
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.autoreverses = false
        groupAnimation.isRemovedOnCompletion = true
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        
        return groupAnimation
    }
    

    class func add(to view:UIView,color:UIColor = color,touches:Set<UITouch>) {
        
        if let shape:CAShapeLayer = KBubble.addOval(to: view) as CAShapeLayer! {
            
            let touch = touches.first
            let location = touch?.location(in: view)
            let newLocation:CGPoint = CGPoint(x: location!.x - 121, y: location!.y - 121)
            
            shape.position = newLocation
            shape.fillColor = color.cgColor
            shape.strokeColor = color.cgColor
            
            view.layer.addSublayer(shape)

            shape.add(addAnimation(to: shape), forKey: nil)
            
        }
    }
    
}//




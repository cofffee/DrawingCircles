//
//  CircleView.swift
//  DrawingCircles
//
//  Created by Remigio, Kevin (Contractor) on 10/30/16.
//  Copyright © 2016 Remigio, Kevin (Contractor). All rights reserved.
//

import UIKit

class CircleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var circleLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 5.0;
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
    }
    func animateCircle(duration: TimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
    }
    func animateCirclePulse(duration: TimeInterval) {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = duration
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        
        animation.fromValue = 1.2
        animation.toValue = 0.8
        
        circleLayer.add(animation, forKey: "animateCirclePulse")
        
        //CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //scaleAnimation.duration = 0.2;
        //scaleAnimation.repeatCount = HUGE_VAL;
        //scaleAnimation.autoreverses = YES;
        //scaleAnimation.fromValue = [NSNumber numberWithFloat:1.2];
        //scaleAnimation.toValue = [NSNumber numberWithFloat:0.8];
        
        //[view.layer addAnimation:scaleAnimation forKey:@"scale"];
    
    }
    func animateCircleFade(duration: TimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "opacity")
        
//        animation.fromValue = UIColor.red.cgColor
//        animation.toValue = UIColor.blue.cgColor
        
        animation.fromValue = 0
        animation.toValue = 1
        
        animation.duration = duration
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
//        flash.fromValue = [NSNumber numberWithFloat:0.0];
//        flash.toValue = [NSNumber numberWithFloat:1.0];
//        flash.duration = 1.0;        // 1 second
//        flash.autoreverses = YES;    // Back
//        flash.repeatCount = 3;       // Or whatever
        
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        //animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
//        circleLayer.strokeEnd = 1.0
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircleFade")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

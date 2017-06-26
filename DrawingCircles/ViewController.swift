//
//  ViewController.swift
//  DrawingCircles
//
//  Created by Remigio, Kevin (Contractor) on 10/30/16.
//  Copyright © 2016 Remigio, Kevin (Contractor). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)

        let circle:CircleView = CircleView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.addSubview(circle)
        
        // Animate the drawing of the circle over the course of 1 second
        circle.animateCircle(duration: 0.01)

        //circle.animateCirclePulse(duration: 0.5)
        circle.animateCircleFade(duration: 1.5)
    }


}


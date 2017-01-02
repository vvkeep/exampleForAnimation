//
//  YWSpringAnimationViewController.swift
//  exampleForAnimation
//
//  Created by 姚巍 on 17/1/2.
//  Copyright © 2017年 姚巍. All rights reserved.
//  弹簧动画

import UIKit

class YWSpringAnimViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
         let label = UILabel(frame: CGRect(x: 10, y: 200, width: 50, height: 30))
        label.backgroundColor = UIColor.red
        view.addSubview(label)
        let spring = CASpringAnimation(keyPath: "position.x")
        spring.damping = 5;
        spring.stiffness = 100;
        spring.mass = 1;
        spring.initialVelocity = 0;
        spring.fromValue = label.layer.position.x;
        spring.toValue = label.layer.position.x + 100;
        spring.autoreverses = true
        spring.repeatCount = Float.infinity
        spring.duration = spring.settlingDuration;
        label.layer.add(spring, forKey: spring.keyPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

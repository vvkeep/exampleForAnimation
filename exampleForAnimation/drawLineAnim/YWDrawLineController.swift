//
//  YWDrawLineController.swift
//  exampleForAnimation
//
//  Created by 姚巍 on 16/12/19.
//  Copyright © 2016年 姚巍. All rights reserved.
//  划线动画

import UIKit

class YWDrawLineController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let tempView = UIView(frame: CGRect(x: 50, y: 100, width: 250, height: 500))
        let bezierPath = UIBezierPath(ovalIn: tempView.frame)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = bezierPath.cgPath
        view.layer.addSublayer(shapeLayer)
        
        let pathAnim = CABasicAnimation(keyPath: "strokeEnd")
        pathAnim.duration = 5.0
        pathAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pathAnim.fromValue = 0
        pathAnim.toValue = 1
        pathAnim.autoreverses = true
        pathAnim.fillMode = kCAFillModeForwards
//        pathAnim.isRemovedOnCompletion = false
        pathAnim.repeatCount = Float.infinity
        shapeLayer.add(pathAnim, forKey: "strokeEndAnim")
     
    }

}

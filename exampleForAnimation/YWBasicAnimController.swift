//
//  YWBasicAnimController.swift
//  exampleForAnimation
//
//  Created by 姚巍 on 16/12/18.
//  Copyright © 2016年 姚巍. All rights reserved.
//

import UIKit

class YWBasicAnimController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        /**------------------------旋转动画-------------------------------------*/
        let rorationViewX = UIView(frame: CGRect(x: 20, y: 100, width: 70, height: 70))
        rorationViewX.backgroundColor = UIColor.red
        view.addSubview(rorationViewX)
        let rotationAnimX = CABasicAnimation(keyPath: "transform.rotation.x")
        rotationAnimX.beginTime = 0.0
        rotationAnimX.toValue = 2 * M_PI
        rotationAnimX.duration = 1.5
        rotationAnimX.repeatCount = Float.infinity
        rorationViewX.layer.add(rotationAnimX, forKey: "rotationAnimX")
        
        let rorationViewY = UIView(frame: CGRect(x: 150, y: 100, width: 70, height: 70))
        rorationViewY.backgroundColor = UIColor.red
        view.addSubview(rorationViewY)
        let rotationAnimY = CABasicAnimation(keyPath: "transform.rotation.y")
        rotationAnimY.beginTime = 0.0
        rotationAnimY.toValue = 2 * M_PI
        rotationAnimY.duration = 1.5
        rotationAnimY.repeatCount = Float.infinity
        rorationViewY.layer.add(rotationAnimY, forKey: "rotationAnimY")
        
        let rorationViewZ = UIView(frame: CGRect(x: 280, y: 100, width: 70, height: 70))
        rorationViewZ.backgroundColor = UIColor.red
        view.addSubview(rorationViewZ)
        let rotationAnimZ = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimZ.beginTime = 0.0
        rotationAnimZ.toValue = 2 * M_PI
        rotationAnimZ.duration = 1.5
        rotationAnimZ.repeatCount = Float.infinity
        rorationViewZ.layer.add(rotationAnimZ, forKey: "rotationAnimZ")
        
        /**------------------------移动动画-------------------------------------*/
        let moveView = UIView(frame:  CGRect(x: 20, y: 240, width: 70, height: 70))
        moveView.center = CGPoint(x: 40, y: 200)
        moveView.backgroundColor = UIColor.red
        view.addSubview(moveView)
        let moveAnim = CABasicAnimation(keyPath: "position")
        moveAnim.fromValue = NSValue(cgPoint: CGPoint(x: 40, y: 240))
        moveAnim.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 240))
        moveAnim.duration = 2
        moveAnim.repeatCount = Float.infinity
        moveAnim.autoreverses = true
        // 以下两句 控制View动画结束后，停留在动画结束的位置
//        moveAnim.isRemovedOnCompletion = false
//        moveAnim.fillMode = kCAFillModeForwards
        
        moveView.layer.add(moveAnim, forKey: "moveAnim")
        
        /**------------------------背景颜色变化动画-------------------------------------*/
        let colorView = UIView(frame: CGRect(x: 20, y: 310, width: 70, height: 70))
        colorView.backgroundColor = UIColor.red
        view.addSubview(colorView)
        let colorAnim = CABasicAnimation(keyPath: "backgroundColor")
        colorAnim.fromValue = UIColor.red.cgColor
        colorAnim.toValue = UIColor.green.cgColor
        colorAnim.autoreverses = true
        colorAnim.repeatCount = Float.infinity
        colorAnim.duration = 2
        colorView.layer.add(colorAnim, forKey: "colorAnim")

        /**------------------------内容变化动画-------------------------------------*/
        let imageView = UIImageView(frame: CGRect(x: 150, y: 310, width: 70, height: 70))
        imageView.image = UIImage(named: "from")
        view.addSubview(imageView)
        let contentsAnim = CABasicAnimation(keyPath: "contents")
        contentsAnim.toValue = UIImage(named: "to")?.cgImage
        contentsAnim.duration = 1.5
        contentsAnim.autoreverses = true
        contentsAnim.repeatCount = Float.infinity
        imageView.layer.add(contentsAnim, forKey: "contentsAnim")
        
        /**------------------------圆角变化动画-------------------------------------*/
        let cornerRadiusView = UIView(frame: CGRect(x: 280, y: 310, width: 70, height: 70))
        cornerRadiusView.backgroundColor = UIColor.red
        view.addSubview(cornerRadiusView)
        cornerRadiusView.layer.masksToBounds = true
        let cornerRadiusAnim = CABasicAnimation(keyPath: "cornerRadius")
        cornerRadiusAnim.toValue = 35
        cornerRadiusAnim.duration = 2
        cornerRadiusAnim.autoreverses = true
        cornerRadiusAnim.repeatCount = Float.infinity
        cornerRadiusView.layer.add(cornerRadiusAnim, forKey: "cornerRadiusAnim")
        
        /**------------------------比例缩放动画-------------------------------------*/
        let scaleView = UIView(frame: CGRect(x: 20, y: 410, width: 70, height: 70))
        scaleView.backgroundColor = UIColor.red
        view.addSubview(scaleView)
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
        scaleAnim.fromValue = 0.3
        scaleAnim.toValue = 1.3
        scaleAnim.duration = 2
        scaleAnim.autoreverses = true
        scaleAnim.repeatCount = Float.infinity
        scaleView.layer.add(scaleAnim, forKey: "scaleAnim")
        
        /**------------------------比例缩放动画X-------------------------------------*/
        let scaleViewX = UIView(frame: CGRect(x: 150, y: 410, width: 70, height: 70))
        scaleViewX.backgroundColor = UIColor.red
        view.addSubview(scaleViewX)
        let scaleAnimX = CABasicAnimation(keyPath: "transform.scale.x")
        scaleAnimX.fromValue = 0.3
        scaleAnimX.toValue = 1.3
        scaleAnimX.duration = 2
        scaleAnimX.autoreverses = true
        scaleAnimX.repeatCount = Float.infinity
        scaleViewX.layer.add(scaleAnimX, forKey: "scaleAnimX")
        
        /**------------------------比例缩放动画Y-------------------------------------*/
        let scaleViewY = UIView(frame: CGRect(x: 280, y: 410, width: 70, height: 70))
        scaleViewY.backgroundColor = UIColor.red
        view.addSubview(scaleViewY)
        let scaleAnimY = CABasicAnimation(keyPath: "transform.scale.y")
        scaleAnimY.fromValue = 0.3
        scaleAnimY.toValue = 1.3
        scaleAnimY.duration = 2
        scaleAnimY.autoreverses = true
        scaleAnimY.repeatCount = Float.infinity
        scaleViewY.layer.add(scaleAnimY, forKey: "scaleAnimY")
        
        /**------------------------指定大小缩放-------------------------------------*/
        let boundsView = UIView(frame: CGRect(x: 40, y: 520, width: 20, height: 80))
        boundsView.backgroundColor = UIColor.red
        view.addSubview(boundsView)
        let boundsAnim = CABasicAnimation(keyPath: "bounds")
        boundsAnim.toValue = NSValue(cgRect: CGRect(x: 800, y: 500, width: 90, height: 30))
        boundsAnim.duration = 2
        boundsAnim.autoreverses = true
        boundsAnim.repeatCount = Float.infinity
        boundsView.layer.add(boundsAnim, forKey: "boundsAnim")
        
        /**------------------------透明动画-------------------------------------*/
        let alphaView = UIView(frame: CGRect(x: 150, y: 520, width: 70, height: 70))
        alphaView.backgroundColor = UIColor.red
        view.addSubview(alphaView)
        let alphaAnim = CABasicAnimation(keyPath: "opacity")
        alphaAnim.fromValue = 0.3
        alphaAnim.toValue = 1
        alphaAnim.duration = 0.6
        alphaAnim.autoreverses = true
        alphaAnim.repeatCount = Float.infinity
        alphaView.layer.add(alphaAnim, forKey: "alphaAnim")
        
    }
}

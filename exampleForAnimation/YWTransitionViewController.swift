//
//  YWTransitionViewController.swift
//  exampleForAnimation
//
//  Created by 姚巍 on 17/1/2.
//  Copyright © 2017年 姚巍. All rights reserved.
//  转场动画

import UIKit

class YWTransitionViewController: UIViewController {
    var transitionLab = UILabel()
    
    var index = 0
    
    let animArr = ["cube", "suckEffect", "rippleEffect", "pageCurl", "pageUnCurl", "oglFlip", "cameraIrisHollowOpen", "cameraIrisHollowClose", "spewEffect","genieEffect","unGenieEffect","twist","tubey","swirl","charminUltra", "zoomyIn", "zoomyOut", "oglApplicationSuspend"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        transitionLab = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height:300))
        transitionLab.center = CGPoint(x: 375/2, y: 667/2)
        transitionLab.backgroundColor = UIColor.red
        transitionLab.font = UIFont.systemFont(ofSize: 20)
        transitionLab.numberOfLines = 0
        transitionLab.textColor = UIColor.blue
        transitionLab.textAlignment = .center
        view.addSubview(transitionLab)
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        btn.center = CGPoint(x: 375/2, y: 640)
        btn.setTitle("动画", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc private func btnAction() {
        let pageCurlAnim = CATransition()
        pageCurlAnim.delegate = self
        pageCurlAnim.duration = 1.0
        pageCurlAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pageCurlAnim.type = animArr[index]
        pageCurlAnim.subtype = kCATransitionFromLeft
        pageCurlAnim.repeatCount = 1
        pageCurlAnim.setValue("transitionAnim", forKey: "anim")
        transitionLab.layer.add(pageCurlAnim, forKey: "transition")
         transitionLab.text = "动画效果：\(animArr[index])"
    }
}

extension YWTransitionViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        index = (index < animArr.count - 1) ? index + 1 : 0
        if flag {
            let pageCurlAnim = CATransition()
            pageCurlAnim.delegate = self
            pageCurlAnim.duration = 1.0
            pageCurlAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            pageCurlAnim.type = animArr[index]
            pageCurlAnim.subtype = kCATransitionFromLeft
            pageCurlAnim.autoreverses = true
            pageCurlAnim.repeatCount = 1
            pageCurlAnim.setValue("transitionAnim", forKey: "anim")
            transitionLab.layer.add(pageCurlAnim, forKey: "transition")
             transitionLab.text = "动画效果：\(animArr[index])"
        }
    }
}

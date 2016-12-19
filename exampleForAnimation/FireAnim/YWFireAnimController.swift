//
//  YWFireAnimController.swift
//  exampleForAnimation
//
//  Created by 姚巍 on 16/12/19.
//  Copyright © 2016年 姚巍. All rights reserved.
//

import UIKit
import QuartzCore
class YWFireAnimController: UIViewController {

   /// 发射器对象
   lazy var fireEmitter = CAEmitterLayer()
    
   lazy var candleIV = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        // 发射器在xy平面的中心位置
        fireEmitter.emitterPosition = view.center
        // 发射器的尺寸大小
//        fireEmitter.emitterSize = CGSize(width: 20, height: 60)
        // 发射器的发射模式
//        fireEmitter.emitterMode = kCAEmitterLayerOutline
//        // 发射器的形状
        fireEmitter.emitterShape = kCAEmitterLayerCircle
        // 发射器渲染模式
        fireEmitter.renderMode = kCAEmitterLayerAdditive
        
        // 发射单元 - 火焰
        let fire = CAEmitterCell()
        // 粒子的创建速率，默认为1/s。
        fire.birthRate = 200
        // 粒子存活时间
        fire.lifetime = 0.2
        // 粒子的生存时间容差
        fire.lifetimeRange = 0.5
        fire.color = UIColor.init(colorLiteralRed: 0.8, green: 0.4, blue: 0.2, alpha: 0.1) .cgColor
        fire.contents = UIImage(named: "fire.png")?.cgImage
        fire.name = "fire"
        // 粒子的速度
        fire.velocity = 35
        // 粒子动画的速度容差
        fire.velocityRange = 10
        // 粒子在xy平面的发射角度
        fire.emissionLongitude = CGFloat(M_PI + M_PI_2)
        // 粒子发射角度的容差
        fire.emissionRange = CGFloat(M_PI_2)
        // 缩放速度
        fire.scaleSpeed = 0.3
        // 旋转度
//        fire.spin = 0.2
        
        fireEmitter.emitterCells = [fire]
        view.layer.addSublayer(fireEmitter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}

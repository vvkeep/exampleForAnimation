//
//  YWSingleWaterWaveView.swift
//  exampleForAnimation
//
//  Created by 姚巍 on 16/12/18.
//  Copyright © 2016年 姚巍. All rights reserved.
//

import UIKit

class YWWaterWaveView: UIView {
    
    lazy var waveDisplaylink = CADisplayLink()
    
    lazy var firstWaveLayer = CAShapeLayer()
    
    lazy var secondWaveLayer = CAShapeLayer()
    
    var firstWaveColor: UIColor?
    
    /// 水纹振幅
    var waveA: CGFloat = 10
    
    /// 水纹周期
    var waveW: CGFloat = 1/30.0;
    
    /// 位移
    var offsetX: CGFloat = 0
    
    /// 当前波浪高度Y
    var currentK: CGFloat = 0
    
    /// 水纹速度
    var waveSpeed: CGFloat = 0
    
    /// 水纹路宽度
    var waterWaveWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        layer.masksToBounds = true
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // 波浪宽
        waterWaveWidth = bounds.size.width
        // 波浪颜色
        firstWaveColor = UIColor.green
        // 波浪速度
        waveSpeed = 0.4 / CGFloat(M_PI)
        // 设置闭环的颜色
        firstWaveLayer.fillColor = UIColor.init(colorLiteralRed: 73/255.0, green: 142/255.0, blue: 178/255.0, alpha: 0.5).cgColor
        // 设置边缘线的颜色
//        firstWaveLayer.strokeColor = UIColor.blue.cgColor
        firstWaveLayer.strokeStart = 0.0
        firstWaveLayer.strokeEnd = 0.8
        // 设置闭环的颜色
        secondWaveLayer.fillColor = UIColor.init(colorLiteralRed: 73/255.0, green: 142/255.0, blue: 178/255.0, alpha: 0.5).cgColor
        // 设置边缘线的颜色
//        secondWaveLayer.strokeColor = UIColor.blue.cgColor
        secondWaveLayer.strokeStart = 0.0
        secondWaveLayer.strokeEnd = 0.8
        layer.addSublayer(firstWaveLayer)
        layer.addSublayer(secondWaveLayer)
        
        // 设置波浪流动速度
        waveSpeed = 0.05
        // 设置振幅
        waveA = 8
        // 设置周期
        waveW = 2 * CGFloat(M_PI) / bounds.size.width
        // 设置波浪纵向位置
        currentK = bounds.size.height / 2 //屏幕居中
        
        waveDisplaylink = CADisplayLink(target: self, selector: #selector(getCurrentWave))
        waveDisplaylink.add(to: RunLoop.current, forMode: .commonModes)
    }
    
    @objc private func getCurrentWave(disPlayLink: CADisplayLink) {
        // 实时位移
        offsetX += waveSpeed
        setCurrentFirstWaveLayerPath()
    }
    
    private func setCurrentFirstWaveLayerPath() {
        // 创建一个路径
        let path = CGMutablePath()
        var y = currentK
        path.move(to: CGPoint(x: 0, y: y))
        
        for i in 0...Int(waterWaveWidth) {
            y = waveA * sin(waveW * CGFloat(i) + offsetX) + currentK
            path.addLine(to: CGPoint(x: CGFloat(i), y: y))
        }
        
        path.addLine(to: CGPoint(x: waterWaveWidth, y: bounds.size.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        path.closeSubpath()
        firstWaveLayer.path = path
        
        // 创建一个路径
        let path2 = CGMutablePath()
        var y2 = currentK
        path2.move(to: CGPoint(x: 0, y: y))
        
        for i in 0...Int(waterWaveWidth) {
            y2 = waveA * sin(waveW * CGFloat(i) + offsetX - waterWaveWidth/2 ) + currentK
            path2.addLine(to: CGPoint(x: CGFloat(i), y: y2))
        }
        
        path2.addLine(to: CGPoint(x: waterWaveWidth, y: bounds.size.height))
        path2.addLine(to: CGPoint(x: 0, y: bounds.size.height))
        path2.closeSubpath()
        secondWaveLayer.path = path2
    }
    
    deinit {
        waveDisplaylink.invalidate()
    }
    
}

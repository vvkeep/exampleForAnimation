//
//  YWSingleWaterWaveView.swift
//  exampleForAnimation
//
//  Created by 姚巍 on 16/12/18.
//  Copyright © 2016年 姚巍. All rights reserved.
//

import UIKit

class YWSingleWaterWaveView: UIView {
    
    lazy var waveDisplaylink = CADisplayLink()
    lazy var firstWaveLayer = CAShapeLayer()
    var firstWaveColor: UIColor?
    
    /// 水纹振幅
    let waveA: CGFloat = 10
    
    /// 水纹周期
    let waveW: CGFloat = 1/30.0;
    
    /// 位移
    let offsetX: CGFloat = 0
    
    /// 波浪纵向位置
    let currentK = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

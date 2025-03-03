//
//  ViewController.swift
//  kylDrawDemo
//
//  Created by yulu kong on 2019/10/8.
//  Copyright © 2019 yulu kong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //testDrawRect()
        testDrawPan()
    }


}


extension ViewController {
    // 返回当前屏幕宽度
    func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    private func testWaveAnimation() {
        // 创建文本标签
        let label = UILabel()
        label.text = "正在加载中......"
        label.textColor = .white
        label.textAlignment = .center
        label.frame = CGRect(x: (screenWidth() * 0.5 - 100), y: 0, width: 200, height: 50)
        
        // 创建波浪视图
        let waveView = KWaveView(frame: CGRect(x: 0, y: 0, width: screenWidth(),
                                              height: 130))
        // 波浪动画回调
        waveView.closure = {centerY in
            // 同步更新文本标签的y坐标
            label.frame.origin.y = waveView.frame.height + centerY - 55
        }
        
        // 添加两个视图
        self.view.addSubview(waveView)
        self.view.addSubview(label)
        
        // 开始播放波浪动画
        waveView.startWave()
    }
    
    private func testDrawRect() {
        let frame = CGRect(x: 30, y: 30, width: 250, height: 100)
        let cgView = KDrawRect(frame: frame)
        view.addSubview(cgView)

    }
    
    private func testDrawPan() {
        view.addSubview(KDrawPanView(frame: CGRect(x: 10, y: 200, width: 400, height: 400)))
    }
    
    
}

// MARK - 测试动画
extension ViewController {
    
}


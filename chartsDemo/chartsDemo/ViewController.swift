//
//  ViewController.swift
//  chartsDemo
//
//  Created by 吴宇飞 on 2018/1/23.
//  Copyright © 2018年 gyd. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController {
    
    let lineview = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 230.0/255, green: 253.0/255, blue: 253.0/255, alpha: 1)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func configUI() {
        lineview.delegate = self as! ChartViewDelegate
        lineview.frame = CGRect(x: 20, y: 30, width: self.view.bounds.size.width-40, height: self.view.bounds.size.height-60)
        self.view.addSubview(lineview)
        lineview.backgroundColor = UIColor(red: 230.0/255, green: 253.0/255, blue: 253.0/255, alpha: 1)
        lineview.noDataText = "暂无数据"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


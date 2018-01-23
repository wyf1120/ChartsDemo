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
    let date = LineChartData()
    
    
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
        
        //交互样式
        lineview.scaleYEnabled = false
        lineview.doubleTapToZoomEnabled = false
        lineview.dragEnabled = true
        lineview.dragDecelerationEnabled = true
        lineview.dragDecelerationFrictionCoef = 0.9
        
        //X轴样式
        let xAxis = lineview.xAxis
        xAxis.axisLineWidth = 1.0/UIScreen.main.scale
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.spaceMax = 4
        xAxis.labelTextColor = UIColor(red: 5.0/255, green: 119.0/255, blue: 72.0/255, alpha: 1)
        
        //Y轴样式
        lineview.rightAxis.enabled = false
        let leftAxis = lineview.leftAxis
        leftAxis.labelCount = 5
        leftAxis.forceLabelsEnabled = false
        leftAxis.axisMinimum = 0
        leftAxis.axisMaximum = 100
        leftAxis.inverted = false
        leftAxis.axisLineWidth = 1.0/UIScreen.main.scale
        leftAxis.axisLineColor = UIColor.black
        leftAxis.labelTextColor = UIColor(red: 230.0/255, green: 253.0/255, blue: 253.0/255, alpha: 1)
        leftAxis.labelFont = UIFont.systemFont(ofSize: 10.0)
        
        //网络线样式
        leftAxis.gridLineDashLengths = [3.0,3.0]
        leftAxis.gridColor = UIColor(red: 200.0/255, green: 200.0/255, blue: 200.0/255, alpha: 1)
        leftAxis.gridAntialiasEnabled = true
        
        //描述
        lineview.chartDescription?.text = "交易数量"
        lineview.chartDescription?.textColor = UIColor.darkGray
        
    }
    
    func setData() -> LineChartData {
        let xVals_count = 6
        let maxYval = 100
        
        //X轴显示的数据
        var xValus = [String]()
        for index in 1...xVals_count {
            xValus.append("\(index*10)"+"分钟前")
            
        }
        
        //Y轴显示的数据
        var yValus = [ChartDataEntry]()
        for index in 1...4 {
            let entry = ChartDataEntry(x: Double(index), y: Double(index*10))
            yValus.append(entry)
        }
        
        var set1:LineChartDataSet?
        
        //let bl = lineview.data?.dataSetCount > 1
        
        
        if (lineview.data!.dataSetCount > 0) {
            let data = lineview.data
            set1 = data?.dataSets[0] as! LineChartDataSet
            
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


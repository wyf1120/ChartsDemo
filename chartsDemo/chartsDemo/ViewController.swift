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
    var date = LineChartData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 230.0/255, green: 253.0/255, blue: 253.0/255, alpha: 1)
        configUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func configUI() {
        lineview.delegate = self as? ChartViewDelegate
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
        
        self.date = setData()
        lineview.data = self.date
        lineview.animate(xAxisDuration: 1.5)
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
        
        var set1:IChartDataSet?
        
        //let bl = lineview.data?.dataSetCount > 1
        
        if ( 1 > 2) {
            let data:LineChartData = lineview.data as! LineChartData
            set1 = data.dataSets[0] as! LineChartDataSet
            return data
            
        }
        else
        {
            set1 = LineChartDataSet(values: yValus, label: "lineName")
            
//            //设置折线样式
//            set1?.lineWidth = 1.0/UIScreen.main.scale
//            set1?.drawValuesEnabled = true
//            set1?.valueColors = [UIColor.brown]
//            set1?.setColor(UIColor(red: 0/255, green: 127.0/255, blue: 1, alpha: 1))
//            //拐点
//            set1?.drawCirclesEnabled = false
//            set1?.circleRadius = 4.0
//            set1?.circleColors = [UIColor.red ,UIColor.green]
//            set1?.drawCircleHoleEnabled = true
//            set1?.circleHoleRadius = 2.0
//            set1?.circleHoleColor = UIColor.black
            
            //将linechartDataSet对象放入数组中
            var dataSets:Array<Any>?
            dataSets?.append(set1)
            
            //创建lineChartData对象，此对象就是lineChartview需要的数据对象
            
            let data = LineChartData(dataSets: dataSets as? [IChartDataSet])
            
            data.setValueFont(UIFont.init(name: "HelveticaNeue-Light", size: 8.0))
            data.setValueTextColor(UIColor.gray)
            return data
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


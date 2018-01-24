//
//  chartController.swift
//  chartsDemo
//
//  Created by 吴宇飞 on 2018/1/24.
//  Copyright © 2018年 gyd. All rights reserved.
//

import UIKit
import Charts
class chartController: UIViewController {

    let lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(lineChart)
        
        lineChart.frame = CGRect(x: 20, y: 30, width: self.view.bounds.size.width-40, height: self.view.bounds.size.height-60)
        
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        
        setChart(months, values: unitsSold)
        
        // Do any additional setup after loading the view.
    }

    //设置charts方法
    func setChart(_ dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "单位：万元")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        
        lineChart.data = lineChartData
        //右下角图标描述
        lineChart.chartDescription?.text = "ChartView"
        
        //左下角图例
        //        lineChart.legend.formSize = 30
        //        lineChart.legend.form = .square
        lineChart.legend.textColor = UIColor.black
        
        //设置X轴坐标
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        lineChart.xAxis.granularity = 1.0
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.axisLineColor = UIColor.black
        lineChart.xAxis.labelTextColor = UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1)
        
        //设置Y轴坐标
        //        lineChart.rightAxis.isEnabled = false
        //不显示右侧Y轴
        lineChart.rightAxis.drawAxisLineEnabled = false
        //不显示右侧Y轴数字
        lineChart.rightAxis.enabled = false
        lineChart.leftAxis.axisLineColor = UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1)
        lineChart.leftAxis.gridColor = UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1)
        lineChart.leftAxis.labelTextColor = UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1)
        
        //设置双击坐标轴是否能缩放
        lineChart.scaleXEnabled = false
        lineChart.scaleYEnabled = false
        
        //        lineChart.dragEnabled = true
        //        lineChart.dragDecelerationEnabled = true
        
        //设置图表背景色和border
        //必须设置enable才能有效
        //        lineChart.drawGridBackgroundEnabled = true
        //        lineChart.drawBordersEnabled = true
        //        lineChart.gridBackgroundColor = UIColor.red
        //        lineChart.borderColor = UIColor.orange
        //        lineChart.borderLineWidth = 5
        
        //设置折线线条
        //        lineChartDataSet.fillColor = kDefault_0xff6600_clolr
        //        lineChartDataSet.lineWidth = 4
        
        //外圆
        lineChartDataSet.setCircleColor(UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1))
        //画外圆
        //        lineChartDataSet.drawCirclesEnabled = true
        //内圆
        lineChartDataSet.circleHoleColor = UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1)
        //画内圆
        //        lineChartDataSet.drawCircleHoleEnabled = true
        
        //线条显示样式
        //        lineChartDataSet.lineDashLengths = [1,3,4,2]
        //        lineChartDataSet.lineDashPhase = 0.5
        lineChartDataSet.colors = [UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1)]
        
        //线条上的文字
        lineChartDataSet.valueColors = [UIColor(red: 63.0/255, green: 89.0/255, blue: 152.0/255, alpha: 1)]
        //显示
        //        lineChartDataSet.drawValuesEnabled = true
        
        //添加显示动画
        lineChart.animate(xAxisDuration: 1)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

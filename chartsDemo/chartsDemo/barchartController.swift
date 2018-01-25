//
//  barchartController.swift
//  chartsDemo
//
//  Created by wyf on 2018/1/26.
//  Copyright © 2018年 gyd. All rights reserved.
//

import UIKit
import Charts
class barchartController: UIViewController {

    let barchartV = BarChartView(frame: CGRect(x: 20, y: 60, width: 375-40, height: 667-120))
    var data:BarChartData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        // Do any additional setup after loading the view.
    }

    func configUI() {
        barchartV.delegate = self as? ChartViewDelegate
        self.view.addSubview(barchartV)
        
        //基本样式
        barchartV.backgroundColor = UIColor(red: 230.0/255, green: 253.0/255, blue: 253.0/255, alpha: 1)
        barchartV.noDataText = "暂无数据"
        barchartV.drawValueAboveBarEnabled = true
        barchartV.drawBarShadowEnabled = false
        
        //交互设置
        barchartV.scaleYEnabled = false
        barchartV.doubleTapToZoomEnabled = false
        barchartV.dragEnabled = true
        barchartV.dragDecelerationEnabled = true
        barchartV.dragDecelerationFrictionCoef = 0.9
        
        //x轴样式
        let xa = barchartV.xAxis
        xa.valueFormatter = self as? IAxisValueFormatter
        xa.axisLineWidth = 1
        xa.labelPosition = .bottom
        xa.drawGridLinesEnabled = false
        xa.labelWidth = 4
        xa.labelTextColor = UIColor.brown
        
        //y轴样式
        barchartV.rightAxis.enabled = false
        
        let leftax = barchartV.leftAxis
        leftax.forceLabelsEnabled = false
        
        //根据最大值、最小值、和等分数量设置Y值数据
        leftax.axisMinimum = 0
        leftax.axisMaximum = 100
        leftax.labelCount = 5
        leftax.inverted = false
        leftax.axisLineWidth = 0.5
        leftax.axisLineColor = UIColor.black
//        let number:NumberFormatter = leftax.valueFormatter as! NumberFormatter
//        number.positiveSuffix = " %"
        leftax.labelPosition = .outsideChart
        leftax.labelTextColor = UIColor.brown
        leftax.labelFont = UIFont.systemFont(ofSize: 10)
        
        //设置虚线样式的网络格
        leftax.gridLineDashLengths = [3.0,3.0]
        leftax.gridColor = UIColor(red: 200.0/255, green: 200.0/255, blue: 200.0/255, alpha: 1)
        leftax.gridAntialiasEnabled = true
        barchartV.chartDescription?.text = "柱状图"
        
        barchartV.data = setData()
        barchartV.animate(yAxisDuration: 1.0)
    }
    
    func setData() -> BarChartData {
        
        let xData_count = 6
        
        
        //x轴的数据
        var xdataArr:[Any] = Array()
        for index in 1...xData_count {
            xdataArr.append("\(index)月")
        }
        
        //y轴数据
        var ydataArr:[Any] = Array()
        for index in 1...xData_count {
            let val = 23+2*index
            let entry = BarChartDataEntry(x: Double(index), y: Double(val))
            ydataArr.append(entry)
            
        }
        
        //创建BarChartDataSet对象，其中包含有Y轴数据信息，以及可以设置柱形样式
        let set1 = BarChartDataSet(values: ydataArr as? [ChartDataEntry], label: nil)
        set1.barBorderWidth = 0.2
        set1.drawValuesEnabled = true
        set1.highlightEnabled = true
        set1.setColor(UIColor.green)
        let dataSets = [set1]
        
        //创建barChartData对象
        let data:BarChartData = BarChartData(dataSets: dataSets)
        data.barWidth = 0.8
        data.setValueFont(NSUIFont(name: "HelveticaNeue-Light", size: 10))
        data.setValueTextColor(NSUIColor.orange)
        
        return data
        
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

//
//  PieChartViewController.swift
//  ChartDemo
//
//  Created by Chinh on 5/20/24.
//

import UIKit
import DGCharts
import SnapKit

class PieChartViewController: UIViewController {
    
    private lazy var pieChartView: PieChartView = {
        let chart = PieChartView()
        return chart
    }()
    
    private let players = [
        "Ozil",
        "Ramsey",
        "Laca",
        "Auba",
        "Xhaka",
        "Torreira"
    ]
    private let goals = [6, 8, 26, 30, 8, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        customizeChart(dataPoints: players, values: goals.map{ Double($0) })
    }
    
    private func setupLayout() {
        view.addSubview(pieChartView)
        pieChartView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.leading.trailing.centerY.equalToSuperview()
        }
    }
    
    private func customizeChart(dataPoints: [String], values: [Double]) {
        
        // 1. Set ChartDataEntry
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        // 3. Set ChartData
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        // 4. Assign it to the chart’s data
        pieChartView.data = pieChartData
    }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        return colors
    }
}


//
//  LineChartViewController.swift
//  ChartDemo
//
//  Created by Chinh on 5/21/24.
//

import UIKit
import DGCharts

class LineChartViewController: UIViewController {
    
    private lazy var lineChartView: LineChartView = {
        let chart = LineChartView()
        return chart
    }()
    
    let players = [
        "Ozil",
        "Ramsey",
        "Laca",
        "Auba",
        "Xhaka",
        "Torreira"
    ]
    let goals = [6, 8, 26, 30, 8, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        customizeChart(dataPoints: players, values: goals.map{ Double($0) })
    }
    
    private func setupLayout() {
        view.addSubview(lineChartView)
        lineChartView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.leading.trailing.centerY.equalToSuperview()
        }
    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
          dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "LineChart")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }
}

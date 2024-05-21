//
//  LineChartViewController.swift
//  ChartDemo
//
//  Created by Chinh on 5/21/24.
//

import UIKit
import DGCharts

class LineChartViewController: UIViewController {

    // MARK: - Views
    private lazy var chartLimitLine: ChartLimitLine = {
        let line = ChartLimitLine()
        line.limit = 100
        line.label = "100 goals"
        line.lineWidth = 1.0
        line.lineColor = .systemRed
        line.valueTextColor = .black
        line.lineDashLengths = [3, 3]
        return line
    }()

    private lazy var lineChartView: LineChartView = {
        let chart = LineChartView()
        chart.leftAxis.axisMaximum = 120
        chart.leftAxis.addLimitLine(chartLimitLine)
        return chart
    }()
    
    // MARK: - Properties
    let players = ["Ozil", "Ramsey", "Laca", "Auba", "Xhaka", "Torreira", "Chinh"]
    let goals = [6, 10, 10, 30, 26, 10, 100]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        customizeChart(players: players, goals: goals.map{ Double($0) })
    }
    
    private func setupLayout() {
        view.addSubview(lineChartView)
        lineChartView.snp.makeConstraints {
            $0.height.equalTo(400)
            $0.leading.trailing.centerY.equalToSuperview()
//            $0.edges.equalToSuperview().inset(50)
        }
    }
    
    func customizeChart(players: [String], goals: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<players.count {
          let dataEntry = ChartDataEntry(x: Double(i), y: goals[i])
          dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "LineChart")
        lineChartDataSet.mode = .horizontalBezier
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }
}

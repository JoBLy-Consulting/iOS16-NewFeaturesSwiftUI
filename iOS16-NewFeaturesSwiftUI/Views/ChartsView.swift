//
//  ChartsView.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 13/09/2022.
//

import SwiftUI
import Charts

struct MonthChartsView: View {
    let subscriptionsList = SubscriptionList()
    
    var body: some View {
        VStack {
            Text("Monthly subscriptions")
            Chart(subscriptionsList._subscriptions) {
                LineMark(x: .value("Month", $0.month, unit: .month), y: .value("Subscriptions", $0.dailyAverage))
                    .foregroundStyle(.red)
                    .interpolationMethod(.catmullRom)
                PointMark(x: .value("Month", $0.month, unit: .month), y: .value("Subscriptions", $0.dailyAverage))
                    .symbol(.diamond)
                AreaMark(x: .value("Month", $0.month, unit: .month), y: .value("Subscriptions", $0.dailyAverage))
                    .interpolationMethod(.catmullRom)
                    .opacity(0.2)
                
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.narrow), centered: true)
                }
            }
        }
    }
}

struct QuarterChartsView: View {
    let subscriptionsList = SubscriptionList()
    
    var body: some View {
        VStack {
            Text("Quarter subscriptions")
            Chart(subscriptionsList._subscriptions) {
                BarMark(
                    x: .value("Quarter", $0.month, unit: .quarter),
                    y: .value("Subscriptions", $0.numberSubscription)
                )
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    if value.as (Date.self)!.isFirstMonthOfQuarter {
                        AxisGridLine()
                        AxisValueLabel(format: .dateTime.quarter())
                    } else {
                        AxisGridLine()
                    }
                }
            }
        }
    }
}

struct YearChartsView: View {
    let subscriptionsList = SubscriptionList()
    
    var body: some View {
        VStack {
            Text("Yearly subscriptions")
            Chart(subscriptionsList._allSubscriptions) { series in
                ForEach(series.subscriptions) { element in
                    LineMark(x: .value("Month", element.month, unit: .month), y: .value("Subscriptions", element.dailyAverage))
                        .interpolationMethod(.catmullRom)
                    PointMark(x: .value("Month", element.month, unit: .month), y: .value("Subscriptions", element.dailyAverage))
                        .symbol(.diamond)
                }
                .foregroundStyle(by: .value("Year", series.year))
                
            }
            .chartLegend(position: .top)
            .chartForegroundStyleScale([
                "2022": .purple,
                "2021": .green
            ])
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.narrow), centered: true)
                }
            }
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            YearChartsView().frame(width:320,height:240)
            MonthChartsView().frame(width:320, height:240)
            QuarterChartsView().frame(width:320, height:240)
        }
    }
}

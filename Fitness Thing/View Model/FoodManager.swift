//
//  FoodManager.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import Foundation

@Observable
class FoodManager {
    let dateFormatter: DateFormatter
    let numberFormatter: NumberFormatter
    let percentFormatter: NumberFormatter
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.usesGroupingSeparator = false
        
        percentFormatter = NumberFormatter()
        percentFormatter.numberStyle = .percent
    }
}

extension FoodManager {
    func decrementDate(date: Date) -> Date {
        let newDate = Calendar.current.date(byAdding: .day, value: -1, to: date)!
        return newDate
    }
    
    func incrementDate(date: Date) -> Date {
        let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        return newDate
    }
}

extension FoodManager {
    func formatDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    func formatMacro(_ macro: Double) -> String {
        let macro = macro as NSNumber
        return numberFormatter.string(from: macro) ?? "Error retrieving value"
    }
    
    func formatPercent(_ percent: Double) -> String {
        let percent = percent as NSNumber
        return percentFormatter.string(from: percent) ?? "Error retrieving value"
    }
}

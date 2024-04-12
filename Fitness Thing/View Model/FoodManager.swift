//
//  FoodManager.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import Foundation

@Observable
class FoodManager {
    let dateFormatter : DateFormatter
    
    init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "mm/dd/yy"
    }
}

extension FoodManager {
    func formatDate(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}

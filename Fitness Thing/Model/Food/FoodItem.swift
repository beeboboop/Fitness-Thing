//
//  FoodItem.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/28/24.
//

import Foundation

protocol FoodItem {
    var name: String { get }
    var totalCalories: Double { get }
    var totalProtein: Double { get }
    var totalFat: Double { get }
    var totalCarbs: Double { get }
    var percentProtein: Double { get }
    var percentFat: Double { get }
    var percentCarbs: Double { get }
}

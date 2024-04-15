//
//  FoodDay.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import Foundation
import SwiftData

@Model
class FoodDay {
    let date: Date
    let targetCalories: Double
    let targetProtein: Double
    let targetFat: Double
    let targetCarbs: Double
    var mealsEaten: [Meal]
    
    init(date: Date, targetCalories: Double, targetProtein: Double, 
         targetFat: Double, targetCarbs: Double, mealsEaten: [Meal]) {
        self.date = date
        self.targetCalories = targetCalories
        self.targetProtein = targetProtein
        self.targetFat = targetFat
        self.targetCarbs = targetCarbs
        self.mealsEaten = mealsEaten
    }
}

extension FoodDay {
    var totalCalories: Double {
        mealsEaten.reduce(0) {
            $0 + $1.totalCalories
        }
    }
    
    var totalProtein: Double {
        mealsEaten.reduce(0) {
            $0 + $1.totalProtein
        }
    }
    
    var totalFat: Double {
        mealsEaten.reduce(0) {
            $0 + $1.totalFat
        }
    }
    
    var totalCarbs: Double {
        mealsEaten.reduce(0) {
            $0 + $1.totalCarbs
        }
    }
}

extension FoodDay {
    static let standard = FoodDay(date: Date(), 
                                  targetCalories: 4000,
                                  targetProtein: 200,
                                  targetFat: 200,
                                  targetCarbs: 200, 
                                  mealsEaten: [Meal.standard, Meal.standard])
}

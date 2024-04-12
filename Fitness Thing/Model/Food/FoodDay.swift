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
    var mealsEaten: [Meal]
    
    init(mealsEaten: [Meal]) {
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

//
//  IngredientTemplate.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import Foundation
import SwiftData

@Model
class IngredientTemplate: FoodItem {
    var name: String
    var servingSize: Double
    var caloriesPerServing: Double
    var proteinPerServing: Double
    var fatPerServing: Double
    var carbsPerServing: Double
    
    init(name: String, servingSize: Double, caloriesPerServing: Double, proteinPerServing: Double, fatPerServing: Double, carbsPerServing: Double) {
        self.name = name
        self.servingSize = servingSize
        self.caloriesPerServing = caloriesPerServing
        self.proteinPerServing = proteinPerServing
        self.fatPerServing = fatPerServing
        self.carbsPerServing = carbsPerServing
    }
}

extension IngredientTemplate {
    var totalCalories: Double {
        caloriesPerServing
    }
    
    var totalProtein: Double {
        proteinPerServing
    }
    
    var totalFat: Double {
        fatPerServing
    }
    
    var totalCarbs: Double {
        carbsPerServing
    }
    
    var percentProtein: Double {
        (totalProtein * 4) / totalCalories
    }
    
    var percentFat: Double {
        (totalFat * 9) / totalCalories
    }
    
    var percentCarbs: Double {
        (totalCarbs * 4) / totalCalories
    }
}

extension IngredientTemplate {
    var expectedCaloriesPerServing: Double {
        (proteinPerServing * 4) + (fatPerServing * 9) + (carbsPerServing * 4)
    }
}

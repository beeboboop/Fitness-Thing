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
    
    var id: UUID = UUID()

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
    convenience init() {
        self.init(name: "", servingSize: 0, caloriesPerServing: 0, proteinPerServing: 0, fatPerServing: 0, carbsPerServing: 0)
    }
}

extension IngredientTemplate {
    var portionSize: Double {
        servingSize
    }
    
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
        (totalProtein * 4) / expectedCaloriesPerServing
    }
    
    var percentFat: Double {
        (totalFat * 9) / expectedCaloriesPerServing
    }
    
    var percentCarbs: Double {
        (totalCarbs * 4) / expectedCaloriesPerServing
    }
    
    var expectedCaloriesPerServing: Double {
        (proteinPerServing * 4) + (fatPerServing * 9) + (carbsPerServing * 4)
    }
}

extension IngredientTemplate {
    func clear() {
        self.name = ""
        self.servingSize = 0
        self.caloriesPerServing = 0
        self.proteinPerServing = 0
        self.fatPerServing = 0
        self.carbsPerServing = 0
    }
}

extension IngredientTemplate {
    static let standard = IngredientTemplate(name: "Standard", servingSize: 20, caloriesPerServing: 105, proteinPerServing: 5, fatPerServing: 5, carbsPerServing: 10)
}

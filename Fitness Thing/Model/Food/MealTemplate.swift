//
//  MealTemplate.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import Foundation
import SwiftData

@Model
class MealTemplate: FoodItem {
    var name: String
    var servingSize: Double
    var ingredients: [Ingredient]
    
    var id: UUID = UUID()

    init(name: String, servingSize: Double, ingredients: [Ingredient]) {
        self.name = name
        self.servingSize = servingSize
        self.ingredients = ingredients
    }
}

extension MealTemplate {
    convenience init() {
        self.init(name: "", servingSize: 0, ingredients: [])
    }
}

extension MealTemplate {
    var caloriesPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalCalories
        }
    }
    
    var proteinPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalProtein
        }
    }
    
    var fatPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalFat
        }
    }

    var carbsPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalCarbs
        }
    }
}

extension MealTemplate {
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
        (totalProtein * 4) / totalCalories
    }
    
    var percentFat: Double {
        (totalFat * 9) / totalCalories
    }
    
    var percentCarbs: Double {
        (totalCarbs * 4) / totalCalories
    }
}

extension MealTemplate {
    func clear() {
        self.name = ""
        self.servingSize = 0
        self.ingredients = []
    }
}

extension MealTemplate {
    static let standard = MealTemplate(name: "Example Meal", servingSize: 100,
                               ingredients: [Ingredient.standard])
}

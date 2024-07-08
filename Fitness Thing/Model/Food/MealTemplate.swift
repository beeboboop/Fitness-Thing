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
}

extension MealTemplate {
    var macrosPerServing: Double {
        proteinPerServing + carbsPerServing + fatPerServing
    }
    
    var percentProtein: Double {
        proteinPerServing / macrosPerServing
    }
    
    var percentFat: Double {
        fatPerServing / macrosPerServing
    }
    
    var percentCarbs: Double {
        carbsPerServing / macrosPerServing
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

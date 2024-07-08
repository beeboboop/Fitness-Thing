//
//  Meal.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import Foundation

struct Meal: Codable, Identifiable, FoodItem {
    var name: String
    var servingSize: Double
    var ingredients: [Ingredient]
    
    var id: UUID = UUID()
    var portionSize: Double
}

extension Meal {
    init(template: MealTemplate) {
        name = template.name
        servingSize = template.servingSize
        ingredients = template.ingredients
        
        portionSize = template.servingSize
    }
}

extension Meal {
    var caloriesPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalCalories
        }
    }
    
    var totalCalories: Double {
        caloriesPerServing * (portionSize/servingSize)
    }
    
    var proteinPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalProtein
        }
    }
    
    var totalProtein: Double {
        proteinPerServing * (portionSize/servingSize)
    }
    
    var fatPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalFat
        }
    }
    
    var totalFat: Double {
        fatPerServing * (portionSize/servingSize)
    }
    
    var carbsPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalCarbs
        }
    }
    
    var totalCarbs: Double {
        carbsPerServing * (portionSize/servingSize)
    }
}

extension Meal {
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

extension Meal {
    static let standard = Meal(name: "Example Meal", 
                               servingSize: 100,
                               ingredients: [Ingredient.standard], 
                               portionSize: 200)
}

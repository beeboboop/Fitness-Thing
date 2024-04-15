//
//  Meal.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import Foundation

struct Meal: Codable, Identifiable {
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

extension Meal {
    static let standard = Meal(name: "Example Meal", 
                               servingSize: 100,
                               ingredients: [Ingredient.standard], 
                               portionSize: 200)
}

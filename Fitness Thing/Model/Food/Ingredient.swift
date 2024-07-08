//
//  Ingredient.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import Foundation

struct Ingredient: Codable, Identifiable, FoodItem {
    var name: String
    var servingSize: Double
    var caloriesPerServing: Double
    var proteinPerServing: Double
    var fatPerServing: Double
    var carbsPerServing: Double
    
    var id: UUID = UUID()
    var portionSize: Double
}

extension Ingredient {
    init(template: IngredientTemplate) {
        name = template.name
        servingSize = template.servingSize
        caloriesPerServing = template.caloriesPerServing
        proteinPerServing = template.proteinPerServing
        fatPerServing = template.fatPerServing
        carbsPerServing = template.carbsPerServing
        
        portionSize = template.servingSize
    }
}

extension Ingredient {
    var totalCalories: Double {
        caloriesPerServing * (portionSize/servingSize)
    }
    
    var totalProtein: Double {
        proteinPerServing * (portionSize/servingSize)
    }
    
    var totalFat: Double {
        fatPerServing * (portionSize/servingSize)
    }
    
    var totalCarbs: Double {
        carbsPerServing * (portionSize/servingSize)
    }
}

extension Ingredient {
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

extension Ingredient {
    static let standard = Ingredient(name: "Example Ingredient", 
                                     servingSize: 40,
                                     caloriesPerServing: 500, 
                                     proteinPerServing: 30,
                                     fatPerServing: 20, 
                                     carbsPerServing: 40,
                                     portionSize: 40)
}

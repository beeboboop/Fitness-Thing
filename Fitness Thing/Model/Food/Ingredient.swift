//
//  Ingredient.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import Foundation

struct Ingredient: Codable {
    var name: String
    var servingSize: Double
    var caloriesPerServing: Double
    var proteinPerServing: Double
    var fatPerServing: Double
    var carbsPerServing: Double
    
    var portionSize: Double
}

extension Ingredient {
    init(template: IngredientTemplate) {
        name = template.name
        servingSize = template.servingSize
        caloriesPerServing = template.servingSize
        proteinPerServing = template.proteinPerServing
        fatPerServing = template.fatPerServing
        carbsPerServing = template.fatPerServing
        
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
    static let standard = Ingredient(name: "Example Ingredient", 
                                     servingSize: 40,
                                     caloriesPerServing: 500, 
                                     proteinPerServing: 30,
                                     fatPerServing: 20, 
                                     carbsPerServing: 40,
                                     portionSize: 40)
}

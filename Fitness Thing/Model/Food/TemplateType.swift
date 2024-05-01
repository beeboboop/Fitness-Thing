//
//  TemplateType.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/29/24.
//

import Foundation

enum TemplateType: String, CaseIterable, Identifiable {
    case meal = "Meals", ingredient = "Ingredients"
    var id: Self { self }
}

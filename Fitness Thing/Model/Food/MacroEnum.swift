//
//  MacroEnum.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import Foundation
import SwiftUI

enum Macro: String {
    case protein = "Protein", fat = "Fat", carbs = "Carbs"
    
    var color: Color {
        switch self {
        case .protein: .accent1
        case .fat: .accent2
        case .carbs: .accent3
        }
    }
}

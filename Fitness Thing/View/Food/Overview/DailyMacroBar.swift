//
//  MacroBarView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct DailyMacroBar: View {
    @Environment(FoodManager.self) var foodManager
    
    let macro : Macro
    let target : Double
    let current : Double
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(macro.rawValue)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .frame(height: 10)
                RoundedRectangle(cornerRadius: 10)
                    .fill(macro.color)
                    .frame(height: 10)
                    .scaleEffect(x: percentOfTarget, anchor: .leading)
            }
            Text("\(foodManager.formatMacro(current))/\(foodManager.formatMacro(target))g")
                .font(.caption)
                
        }
    }
}

extension DailyMacroBar {
    var percentOfTarget : Double {
        let percent = current/target
        return percent > 1 ? 1 : percent
    }
}

#Preview {
    DailyMacroBar(macro: .carbs, target: 200, current: 100)
        .environment(FoodManager())
}

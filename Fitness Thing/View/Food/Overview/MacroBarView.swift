//
//  MacroBarView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct MacroBarView: View {
    let macro : Macro
    let target : Int
    let current : Int
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
            Text("\(current)/\(target)g")
                .font(.caption)
                
        }
    }
}

extension MacroBarView {
    var percentOfTarget : Double {
        Double(current)/Double(target)
    }
}

#Preview {
    MacroBarView(macro: .carbs, target: 200, current: 100)
}

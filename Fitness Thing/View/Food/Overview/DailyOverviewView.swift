//
//  DailyOverviewView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct DailyOverviewView: View {
    var body: some View {
        HStack{
            CalorieCircleView(target: 4000, current: 2000)
                .padding()
            VStack {
                MacroBarView(macro: .protein, target: 200, current: 150)
                MacroBarView(macro: .carbs, target: 200, current: 100)
                MacroBarView(macro: .fat, target: 200, current: 175)
            }
            .padding()
        }
    }
}

#Preview {
    DailyOverviewView()
}

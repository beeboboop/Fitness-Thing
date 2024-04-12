//
//  DailyFoodView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import SwiftUI
import SwiftData

struct DailyFoodView: View {
    @Query private var mealsEaten : [MealTemplate] = []
    var body: some View {
        VStack {
            DateView()
            DailyOverviewView()
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: MealTemplate.self, configurations: config)
        return DailyFoodView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

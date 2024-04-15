//
//  Fitness_ThingApp.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import SwiftUI
import SwiftData

@main
struct FitnessThing: App {
    @State var foodManager = FoodManager()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            FoodDay.self,
            MealTemplate.self,
            IngredientTemplate.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(foodManager)
                .modelContainer(sharedModelContainer)
        }
    }
}

//
//  AddItemSheet.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/26/24.
//

import SwiftUI

struct AddItemSheet: View {
    @State private var isAdding: Bool = false
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            PlusButton(action: {isAdding = true})
        }
        .sheet(isPresented: $isAdding) {
            AddItemSheet()
        }
    }
}

#Preview {
    AddItemSheet()
}

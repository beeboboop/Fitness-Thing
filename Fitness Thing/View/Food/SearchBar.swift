//
//  SearchBar.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/29/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchString: String
    @Binding var isAdding: Bool
    var isTyping: FocusState<Bool>.Binding
    
    var body: some View {
        HStack {
            SearchTextField(searchString: $searchString,
                            isTyping: isTyping)
            PlusButton(action: {isAdding = true})
        }
    }
}

struct SearchTextField: View {
    @Binding var searchString: String
    var isTyping: FocusState<Bool>.Binding
    
    var body: some View {
        HStack {
            TextField("Search...", text: $searchString)
                .focused(isTyping)
            Spacer()
            if !searchString.isEmpty {
                Button(action: {
                    searchString = ""
                    isTyping.wrappedValue = true
                }) {
                    Image(systemName: "x.circle.fill")
                        .foregroundStyle(.gray)
                }
            }
        }
            .padding(8)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(8)
    }
}

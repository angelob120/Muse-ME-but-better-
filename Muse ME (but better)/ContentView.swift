//
//  ContentView.swift
//  Muse ME (but better)
//
//  Created by Angelo Brown on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: String = "Pick a Category"
    @State private var blockingQuestion: String = "What’s blocking you ?"
    @State private var categories = ["Category 1", "Category 2", "Category 3"] // Example categories
    @State private var questions = ["Question 1", "Question 2", "Question 3"] // Example questions
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background
            
            VStack(spacing: 20) {
                Text("Muse Me")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                // Category Dropdown
                Menu {
                    ForEach(categories, id: \.self) { category in
                        Button(category, action: { selectedCategory = category })
                    }
                } label: {
                    DropdownLabel(title: selectedCategory)
                }
                
                // Blocking Question Dropdown
                Menu {
                    ForEach(questions, id: \.self) { question in
                        Button(question, action: { blockingQuestion = question })
                    }
                } label: {
                    DropdownLabel(title: blockingQuestion)
                }
                
                // Generate Button from the uploaded image
                GenerateButton()
                    .frame(width: 200, height: 200)
                    .padding(.top, 50) // Adding some top padding to separate from the previous element
            }
            .padding()
        }
    }
}

struct DropdownLabel: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
    }
}

struct GenerateButton: View {
    var body: some View {
        Button(action: {
            // Your action here
        }) {
            Text("Generate")
                .font(.headline)
                .foregroundColor(Color.black) // Text color
                .frame(width: 200, height: 200) // Button size
                .background(Color(red: 102/255, green: 204/255, blue: 204/255)) // Button background color
                .clipShape(Circle()) // Makes the button circular
                .shadow(radius: 10) // Optional: Adds a shadow effect
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

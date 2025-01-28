//
//  OrderView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct OrderView: View {
  @Binding var selectedTab: Int
  @State private var selectedDrinks: [String: Int] = [:]
  
  // The current category index passed from the parent
  let index: Int
  
  // Computed property to get the current category
  var category: MenuCategory {
    MenuCategory.allCases[index]
  }
  
  var body: some View {
    VStack {
      // Display category title
      HeaderView(selectedTab: $selectedTab, titleText: category.rawValue)
        .edgesIgnoringSafeArea(.all)  // Ignore the top and horizontal safe areas

      // Loop through the drinks for the current category
      ForEach(category.items, id: \.self) { item in
        HStack {
          Text(item)
            .font(.title2)
          
          Spacer()
          
          // Remove item button
          Button(action: {
            if let count = selectedDrinks[item], count > 0 {
              selectedDrinks[item]? -= 1
            }
          }) {
            Image(systemName: "minus.circle")
              .foregroundColor(.red)
              .font(.title2)
          }

          // Counter for quantity
          Text("\(selectedDrinks[item] ?? 0)")
            .frame(width: 30, alignment: .center)

          // Add item button
          Button(action: {
            selectedDrinks[item, default: 0] += 1
          }) {
            Image(systemName: "plus.circle")
              .foregroundColor(.green)
              .font(.title2)
          }
        }
        .padding()
      }
      
      // Add to order button
      Button(action: {
        addToOrder()
      }) {
        Text("Add to Order")
          .font(.title2)
          .frame(maxWidth: .infinity, maxHeight: 50)
          .background(Color.red)
          .foregroundColor(.white)
          .cornerRadius(10)
          .fontWeight(.bold)
      }
      .padding()
      
      Spacer()
    }
    .edgesIgnoringSafeArea(.all)  // Ignore all safe areas, including sides
  }
  
  // Action to handle adding the selected items to the order
  private func addToOrder() {
    print("Adding to Order: \(selectedDrinks)")
    selectedDrinks.removeAll() // Clear the selected items after adding to the order
  }
}

struct OrderView_Previews: PreviewProvider {
  static var previews: some View {
    OrderView(selectedTab: .constant(0), index: 0)
  }
}

//
//  OrderSummaryView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct OrderSummaryView: View {
  let orderSummary: OrderStore  // Will be populated dynamically

  var body: some View {
    ZStack(alignment: .topTrailing) {
      // Close button aligned to top-right
      Button(action: {
        // Implement close action here
      }) {
        Image(systemName: "xmark.circle")
          .font(.title)
          .padding()
      }

      VStack {
        // Title of the summary
        Text("Order Summary")
          .font(.title)
          .padding()

        // Form displaying order details
        Form {
          // Loop through each order day and its orders
          ForEach(orderSummary.orderDays, id: \.id) { day in
            Section(
              header: Text(day.date.formatted(as: "MMM d"))
                .font(.headline)
            ) {
              // Loop through each order of the day
              ForEach(day.orders, id: \.menuName) { order in
                VStack(alignment: .leading) {
                  Text(order.menuName)
                    .font(.title3)
                    .padding(.bottom, 4)
                  // Loop through items in the order
                  ForEach(order.items, id: \.name) { item in
                    HStack {
                      Text(item.name)  // Display each item name
                      Spacer()
                      Text("\(item.quantity)")  // Display quantity of each item
                    }
                  }
                }
              }
            }
          }
        } // Form
      } // VStack
    } // ZStack
  } // body
}

struct OrderSummaryView_Previews: PreviewProvider {
  static var previews: some View {
    OrderSummaryView(orderSummary: OrderStore())
  }
}

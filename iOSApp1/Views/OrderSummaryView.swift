//
//  OrderSummaryView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct OrderSummaryView: View {
  let orderSummary: OrderStore
  @State private var isTimerRunning = false
  @State private var timerStartDate = Date()
  @State private var interval: TimeInterval = 0
  @State private var timer: Timer?

  var body: some View {
    ZStack(alignment: .topTrailing) {
      // Close button aligned to top-right
      Button(action: {}) {
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
          // Loop through each order day and its items
          ForEach(orderSummary.orderDays) { day in
            Section(
              header: Text(day.date.formatted(as: "MMM d"))
                .font(.headline)
            ) {
              // Loop through items for each day
              ForEach(day.items, id: \.name) { item in
                HStack {
                  Text(item.name)
                  Spacer()
                  Text("\(item.quantity)")
                }
              }
            }
          }
          
          // Timer showing a "Hurry Up!" message
          HStack {
            Text("Hurry Up!")
            Spacer()
            
            // Display the timer in MM:SS format
            Text(formatTime(interval))
              .font(.title2)
          }
          
          // Start/Stop button for the timer
          Button(action: {
            toggleTimer()
          }) {
            Text(isTimerRunning ? "Stop Timer" : "Start Timer")
              .font(.title2)
              .foregroundColor(.white)
              .padding()
              .background(isTimerRunning ? Color.red : Color.green)
              .cornerRadius(10)
          }
          .padding(.top)
        } // Form
      } // VStack
    } // ZStack
    .onAppear {
      // Reset the timer interval when the view appears
      interval = 0
    }
  } // body
  
  // Function to toggle the timer on and off
  private func toggleTimer() {
    if isTimerRunning {
      // Stop the timer
      timer?.invalidate()  // Stop the timer when we hit "Stop Timer"
    } else {
      // Start the timer
      timerStartDate = Date()
      startTimer()
    }
    isTimerRunning.toggle()
  }
  
  // Function to start the timer and update the interval
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      let elapsed = Date().timeIntervalSince(timerStartDate)
      interval = elapsed
    }
  }
  
  // Function to format time in MM:SS format
  private func formatTime(_ timeInterval: TimeInterval) -> String {
    let minutes = Int(timeInterval) / 60
    let seconds = Int(timeInterval) % 60
    return String(format: "%02d:%02d", minutes, seconds)
  }
}

struct OrderSummaryView_Previews: PreviewProvider {
  static var previews: some View {
    OrderSummaryView(orderSummary: OrderStore())
  }
}



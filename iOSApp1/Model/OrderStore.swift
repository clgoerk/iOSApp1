//
//  OrderStore.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-23.
//

import Foundation

struct OrderDay: Identifiable {
  var id = UUID()  // Make it identifiable for ForEach
  var date: Date
  var orders: [Order]
}

struct OrderStore {
  var orderDays: [OrderDay] = []
  
  init() {
    #if DEBUG
    createDevData()
    #endif
  }
} // OrderStore()
  


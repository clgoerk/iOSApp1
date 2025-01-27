//
//  OrderStore.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-23.
//

import Foundation

struct OrderDay: Identifiable {
  let id = UUID()
  let date: Date
  var items: [(name: String, quantity: Int)] = [] 
}

struct OrderStore {
  var orderDays: [OrderDay] = []
  
  init() {
    #if DEBUG
    createDevData()
    #endif
  }
} // OrderStore()
  


//
//  OrderStoreDevData.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-23.
//

import Foundation

extension OrderStore {
  mutating func createDevData() {
    orderDays = [
      OrderDay(date: Date(), items: [
        ("Regular", 2),
        ("Boston Cream Donut", 3)
      ]),
      OrderDay(date: Date().addingTimeInterval(-86400), items: [
        ("Iced Coffee", 1),
        ("Bagel & Cream Cheese", 1)
      ]),
      OrderDay(date: Date().addingTimeInterval(-172800), items: [
        ("Chicken Wrap", 1),
        ("Chilli", 2),
        ("Double-Double", 3)
      ])
    ]
  } // createDevData()
} // OrderStore()



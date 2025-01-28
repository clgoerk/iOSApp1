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
      OrderDay(
        date: Date().addingTimeInterval(-86400), 
        orders: [
          // Order for hot drinks
          Order(menuName: MenuCategory.hotDrinks.rawValue, items: [
            (name: MenuCategory.hotDrinks.items[0], quantity: 1), // "Black"
            (name: MenuCategory.hotDrinks.items[1], quantity: 2), // "Regular"
            (name: MenuCategory.hotDrinks.items[2], quantity: 1)  // "Double-Double"
          ]),
          
          // Order for cold drinks
          Order(menuName: MenuCategory.coldDrinks.rawValue, items: [
            (name: MenuCategory.coldDrinks.items[0], quantity: 3), // "Water"
            (name: MenuCategory.coldDrinks.items[1], quantity: 1), // "Coke"
            (name: MenuCategory.coldDrinks.items[2], quantity: 2)  // "Sprite"
          ])
        ]
      )
    ]
  }
}
        


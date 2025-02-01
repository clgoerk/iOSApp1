//
//  Order.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//

import Foundation

struct Order {
  var menuName: String
  var itemName: String
} // Order

enum MenuCategory: String, CaseIterable {
  case hotDrinks = "Hot Drinks"
  case coldDrinks = "Cold Drinks"
  case donuts = "Donuts"
  case sandwiches = "Sandwiches"
  case soups = "Soups"
} // MenuCategory

// Extension for Order to create sample orders
extension Order {
  static let orders = [
    // Hot Drinks
    Order(menuName: MenuCategory.hotDrinks.rawValue, itemName: "Black Coffee"),
    Order(menuName: MenuCategory.hotDrinks.rawValue, itemName: "Regular Coffee"),
    Order(menuName: MenuCategory.hotDrinks.rawValue, itemName: "Double-Double"),
    Order(menuName: MenuCategory.hotDrinks.rawValue, itemName: "Tripple-Tripple"),
    Order(menuName: MenuCategory.hotDrinks.rawValue, itemName: "Hot Chocolate"),
    Order(menuName: MenuCategory.hotDrinks.rawValue, itemName: "French Vanilla"),
    
    // Cold Drinks
    Order(menuName: MenuCategory.coldDrinks.rawValue, itemName: "Water"),
    Order(menuName: MenuCategory.coldDrinks.rawValue, itemName: "Coke"),
    Order(menuName: MenuCategory.coldDrinks.rawValue, itemName: "Sprite"),
    Order(menuName: MenuCategory.coldDrinks.rawValue, itemName: "Orange Juice"),
    Order(menuName: MenuCategory.coldDrinks.rawValue, itemName: "Iced Cappachino"),
    Order(menuName: MenuCategory.coldDrinks.rawValue, itemName: "Iced Coffee"),
    Order(menuName: MenuCategory.coldDrinks.rawValue, itemName: "Chocolate Milk"),
    
    // Donuts
    Order(menuName: MenuCategory.donuts.rawValue, itemName: "Honey Cruller"),
    Order(menuName: MenuCategory.donuts.rawValue, itemName: "Boston Cream"),
    Order(menuName: MenuCategory.donuts.rawValue, itemName: "Chocolate Glazed"),
    Order(menuName: MenuCategory.donuts.rawValue, itemName: "Jelly Filled"),
    Order(menuName: MenuCategory.donuts.rawValue, itemName: "Chocolate Dip"),
    Order(menuName: MenuCategory.donuts.rawValue, itemName: "Maple Dip"),
    
    // Sandwiches
    Order(menuName: MenuCategory.sandwiches.rawValue, itemName: "Turkey Bacon Club"),
    Order(menuName: MenuCategory.sandwiches.rawValue, itemName: "Ham & Swiss"),
    Order(menuName: MenuCategory.sandwiches.rawValue, itemName: "Steak & Cheese"),
    Order(menuName: MenuCategory.sandwiches.rawValue, itemName: "Chicken Caesar Wrap"),
    Order(menuName: MenuCategory.sandwiches.rawValue, itemName: "Bagel & Cream Cheese"),
    Order(menuName: MenuCategory.sandwiches.rawValue, itemName: "Breakfast Sandwich"),
    
    // Soups
    Order(menuName: MenuCategory.soups.rawValue, itemName: "Chicken Noodle"),
    Order(menuName: MenuCategory.soups.rawValue, itemName: "Creamy Tomato"),
    Order(menuName: MenuCategory.soups.rawValue, itemName: "Broccoli Cheddar"),
    Order(menuName: MenuCategory.soups.rawValue, itemName: "Chicken & Rice Soup"),
    Order(menuName: MenuCategory.soups.rawValue, itemName: "Chilli")
  ]
  
  // Group orders by MenuCategory
  static func groupedOrders() -> [MenuCategory: [Order]] {
    var grouped = [MenuCategory: [Order]]()
    
    for order in orders {
      if let category = MenuCategory(rawValue: order.menuName) {
        grouped[category, default: []].append(order)
      }
    } // for
    
    return grouped
  } // groupedOrders()
} // Order



//
//  Order.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-27.
//

import SwiftUI

// Enum to define different categories of drinks
enum DrinkCategory: String, CaseIterable {
  case hotDrinks = "Hot Drinks"
  case coldDrinks = "Cold Drinks"
  case donuts = "Donuts"
  case sandwiches = "Sandwiches"
  case soups = "Soups"
  
  // Example drinks for each category
  var items: [String] {
    switch self {
    case .hotDrinks:
      return [
        "Black",
        "Regular",
        "Double-Double",
        "Hot Chocolate",
        "French Vanilla"
      ]
    case .coldDrinks:
      return [
        "Water",
        "Coke",
        "Sprite",
        "Orange Juice",
        "Iced Coffee",
        "Chocolate Milk"
      ]
    case .donuts:
      return [
        "Honey Cruller",
        "Boston Cream",
        "Chocolate Glazed",
        "Jelly Filled",
        "Chocolate Dip",
        "Maple Dip"
      ]
    case .sandwiches:
      return [
        "Turkey Bacon Club",
        "Ham & Swiss",
        "Steak & Cheese",
        "Chicken Caesar Wrap",
        "Bagel & Cream Cheese",
        "Breakfast Sandwich"
      ]
    case .soups:
      return [
        "Chicken Noodle",
        "Creamy Tomato",
        "Broccoli Cheddar",
        "Chicken & Rice Soup",
        "Chilli"
      ]
    }
  }
}

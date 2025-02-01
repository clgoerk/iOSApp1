//
//  HistoryStore.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//

import Foundation

struct OrderDay: Identifiable {
  let id = UUID()
  let date: Date
  var orders: [String] = []
  var uniqueOrders: [String] {
    Array(Set(orders)).sorted(by: <)
  }
  
  func countOrder(order: String) -> Int {
    return orders.filter { $0 == order }.count
  }
} // OrderDay


class HistoryStore: ObservableObject {
  @Published var orderDays: [OrderDay] = []
  @Published var loadingError = false
  
  enum FileError: Error {
    case loadFailure
    case saveFailure
  } // FileError
  
  init() {
#if DEBUG
    // createDevData()
#endif
    do {
      try load()
    } catch {
      loadingError = true
    }
  } // init
  
  func createNewOrder() {
    let today = Date()
    
    // Check if there is an order for today
    if let _ = orderDays.first(where: { $0.date.isSameDay(as: today) }) {
      // If there is an order for today make a new order for same day
      let newOrderDay = OrderDay(date: today, orders: [])
      
      orderDays.insert(newOrderDay, at: 0)
    } else {
      // If there isno order for today create one
      let newOrderDay = OrderDay(date: today, orders: [])
      orderDays.insert(newOrderDay, at: 0)
    }
    do {
      try save()
    } catch {
      print("Failed to save new entry")
    }
  } // createNewOrder()

  
  var dataURL: URL {
    URL.documentsDirectory
      .appendingPathComponent("history.plist")
  } // dataURL
  
  func load() throws {
    guard let data = try? Data(contentsOf: dataURL) else {
      return
    }
    do {
      let plistData = try PropertyListSerialization.propertyList(
        from: data,
        options: [],
        format: nil)
      let convertedPlistData = plistData as? [[Any]] ?? []
      orderDays = convertedPlistData.map {
        OrderDay(
          date: $0[1] as? Date ?? Date(),
          orders: $0[2] as? [String] ?? [])
      }
    } catch {
      throw FileError.loadFailure
    }
  } // load()
  
  func save() throws {
    let plistData = orderDays.map {
      [$0.id.uuidString, $0.date, $0.orders]
    }
    do {
      let data = try PropertyListSerialization.data(
        fromPropertyList: plistData,
        format: .binary,
        options: .zero)
      try data.write(to: dataURL, options: .atomic)
    } catch {
      throw FileError.saveFailure
    }
  } // save()
  
  func addItemToOrder(_ itemName: String) {
    let today = Date()
    if today.isSameDay(as: orderDays.first?.date ?? Date.distantPast) {
      print("Adding \(itemName)")
      orderDays[0].orders.append(itemName)
    } else {
      orderDays.insert(OrderDay(date: today, orders: [itemName]), at: 0)
    }
    do {
      try save()
    } catch {
      print("Failed to save order history")
    }
  } // addItemToOrder()
  
  func removeItemFromOrder(_ itemName: String) {
    if let todayIndex = orderDays.firstIndex(where: { $0.date.isSameDay(as: Date()) }) {
      if let orderIndex = orderDays[todayIndex].orders.firstIndex(of: itemName) {
        print("Removing \(itemName)")
        orderDays[todayIndex].orders.remove(at: orderIndex)
        
        // If no item in order remove day
        if orderDays[todayIndex].orders.isEmpty {
          orderDays.remove(at: todayIndex)
        }
        
        do {
          try save()
        } catch {
          print("Failed to save order history")
        }
      }
    } // if let
  } // removeItemFromOrder()
  
  func clearHistory() {
    orderDays.removeAll()
  }
} // HistoryStore

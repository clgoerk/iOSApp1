//
//  DateExtension.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//


import Foundation

extension Date {
  /// Format a date using the specified format.
  ///   - parameters:
  ///     - format: A date pattern string like "MM dd".
  func formatted(as format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }

  var yearMonthDay: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy MM dd"
    return dateFormatter.string(from: self)
  }

  /// Check another date is the same year, month and day.
  ///   - parameters:
  ///     - day: The other date.
  func isSameDay(as day: Date) -> Bool {
    return self.yearMonthDay == day.yearMonthDay
  }

  var dayName: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: self)
  }

  var previousSevenDays: [Date] {
    (-6...0).map { day in
      Calendar.current.date(
        byAdding: .day,
        value: day,
        to: self) ?? Date()
    }
  }
}

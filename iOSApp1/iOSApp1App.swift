//
//  iOSApp1App.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

@main
struct iOS1App: App {
  @StateObject private var historyStore = HistoryStore()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .buttonStyle(.raised)
        .environmentObject(historyStore)
        .onAppear {
          print(URL.documentsDirectory)
        }
        .alert(isPresented: $historyStore.loadingError) {
          Alert(
            title: Text("History"),
            message: Text(
              """
              Unfortunately we can’t load your past history.
              Email support:
                support@xyz.com
              """))
        }
    }
  }
}

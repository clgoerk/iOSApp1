//
//  ContentView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 9

  var body: some View {
    ZStack {
      GradientBackground()
        .ignoresSafeArea()
      TabView(selection: $selectedTab) {
        WelcomeView(selectedTab: $selectedTab)
          .tag(9)
        
        // Create Subviews
        ForEach(MenuCategory.allCases.indices, id: \.self) { index in
          OrderView(selectedTab: $selectedTab, index: index)
            .tag(index)
        }
      } // TabView
      .environmentObject(HistoryStore())
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
      .ignoresSafeArea()
    }
  } // body
} // ContentView

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
} // ContentView_Previews

//
//  ContentView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 9 

  var body: some View {
    TabView(selection: $selectedTab) {
      WelcomeView(selectedTab: $selectedTab)
        .tag(9)
        .edgesIgnoringSafeArea(.all)

      // OrderViews for each MenuCategory
      ForEach(MenuCategory.allCases.indices, id: \.self) { index in
        OrderView(selectedTab: $selectedTab, index: index)
          .tag(index)
          .edgesIgnoringSafeArea(.all)
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

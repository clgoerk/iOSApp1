//
//  ContentView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      WelcomeView()
        .edgesIgnoringSafeArea(.all)
      
      ForEach(DrinkCategory.allCases, id: \.self) { category in
        OrderView(category: category)
          .edgesIgnoringSafeArea(.all)  // Ensures each OrderView fills the screen
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .edgesIgnoringSafeArea(.all)  // Ensures the TabView itself fills the screen as well
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

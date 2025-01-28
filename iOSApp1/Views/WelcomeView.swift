//
//  WelcomeView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct WelcomeView: View {
  @Binding var selectedTab: Int // Binding to the selected tab index

  var body: some View {
    ZStack {
      Color.red
        .edgesIgnoringSafeArea(.all)

      VStack {
        // Passing the selectedTab binding to HeaderView
        HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
          .padding(.bottom, 50)
        
        // Logo
        Image("WelcomeImage")
          .resizable()
          .scaledToFit()
          .frame(width: 300, height: 250)
        
        // Title text
        Text("Coffee Run")
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding()

        // Get Started Button
        Button(action: {
          selectedTab = 0 // Navigate to the first tab
        }) {
          HStack {
            Text("Get Started")
            Image(systemName: "arrow.right.circle")
          }
          .padding()
          .background(Color.white)
          .cornerRadius(10)
          .foregroundColor(.red)
        }
        
        Spacer()
        
        // Order Summary Button
        Button("Order Summary") { }
          .padding(.bottom)
          .foregroundColor(.white)
      }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    // Pass a default value for preview
    WelcomeView(selectedTab: .constant(9))
  }
}



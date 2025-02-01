//
//  HeaderView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//

import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleText: String
  
  var body: some View {
    VStack {
      Text(titleText)
        .foregroundColor(.white)
        .font(.largeTitle)
        .fontWeight(.bold)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
      
      HStack(spacing: 0) {
        // Create header for each catagory
        ForEach(MenuCategory.allCases.indices, id: \.self) { index in
          ZStack {
            Color.clear
              .frame(width: 30, height: 30)
            Circle()
              .frame(width: 30, height: 30)
              .foregroundColor(.white)
              .opacity(index == selectedTab ? 0.8 : 0.0)
              .blur(radius: index == selectedTab ? 10 : 0)
            
            Circle()
              .frame(width: 10, height: 10)
              .foregroundColor(.white)
              .shadow(color: index == selectedTab ? Color.white.opacity(1.0) : Color.white, radius: 40, x: 0, y: 0)
          }
          .onTapGesture {
            selectedTab = index
          }
        } // for
      }
      .padding(.bottom, 15)
    }
    .frame(maxWidth: .infinity)
    .frame(height: 90)
    .edgesIgnoringSafeArea(.all)
    .padding(.top, 15)
  } // body
} // HeaderView

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(selectedTab: .constant(0), titleText: "Hot Drinks")
      .previewLayout(.sizeThatFits)
  }
} // HeaderView_Previews

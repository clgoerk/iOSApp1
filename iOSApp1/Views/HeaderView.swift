//
//  HeaderView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleText: String

  var body: some View {
    VStack {
      // Title Text
      Text(titleText)
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(.top, 40)

      // HStack for tab indicators
      HStack {
        ForEach(0..<MenuCategory.allCases.count, id: \.self) { index in
          let fill = index == selectedTab ? ".fill" : "" 
          Image(systemName: "\(index + 1).circle\(fill)")
            .foregroundColor(.white)
            .onTapGesture {
              selectedTab = index
            }
        }
      }
      .font(.title2)
    }
    .frame(maxWidth: .infinity, maxHeight: 150)
    .background(Color.red)
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(selectedTab: .constant(0), titleText: "Welcome")
  }
}

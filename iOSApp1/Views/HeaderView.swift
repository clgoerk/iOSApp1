//
//  HeaderView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct HeaderView: View {
  let titleText: String
  
  var body: some View {
    Color.red
      .frame(maxWidth: .infinity, maxHeight: 150) // Fill width and set height to 150
      .overlay(
        Text(titleText)
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(.top, 50)
      )
  } // body
} // HeaderView()

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(titleText: "Menu")
      .previewLayout(.sizeThatFits)
  }
} // HeaderView_Previews()

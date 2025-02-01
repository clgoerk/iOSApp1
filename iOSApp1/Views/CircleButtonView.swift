//
//  CircleButtonView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-02-01.
//

import SwiftUI

struct CircleButton: View {
  let buttonText: String
  let action: () -> Void

  var body: some View {
    Button(action: {
      action()
    }, label: {
      Text(buttonText)
        .circleButtonTextStyle()
    })
    .buttonStyle(.circle)
  } // body
} // CircleButton

extension ButtonStyle where Self == CircleButtonStyle {
  static var circle: CircleButtonStyle {
    .init()
  }
} // ButtonStyle

struct CircleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 40, height: 40)
      .background(Circle()
        .foregroundColor(.white)
        .shadow(color: Color.black, radius: 10, x: 5, y: 5))
      .foregroundColor(.black)
      .font(.system(size: 10))
  }
} // CircleButtonStyle

extension Text {
  func circleButtonTextStyle() -> some View {
    self
      .font(.system(size: 20))
      .fontWeight(.bold)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .multilineTextAlignment(.center)
  }
} // Text

struct CircleButton_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      CircleButton(buttonText: "+") {
        print("Add Item")
      }
      .buttonStyle(.circle)
      .padding(20)
    }
    .previewLayout(.sizeThatFits)
  }
} // CircleButton_Previews

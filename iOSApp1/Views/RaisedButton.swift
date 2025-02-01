//
//  RaisedButton.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//

import SwiftUI

struct RaisedButton: View {
  let buttonText: String
  let action: () -> Void

  var body: some View {
    Button(action: {
      action()
    }, label: {
      Text(buttonText)
        .raisedButtonTextStyle()
    })
    .buttonStyle(.raised)
  }
} // RaisedButton

extension ButtonStyle where Self == RaisedButtonStyle {
  static var raised: RaisedButtonStyle {
    .init()
  }
} // ButtonStyle

struct RaisedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding([.top, .bottom], 12)
      .background(
        Capsule()
          .foregroundColor(.white)
          .shadow(color: Color.black.opacity(0.3), radius: 6, x: 6, y: 6)
          .shadow(color: Color.white.opacity(0.4), radius: 6, x: -6, y: -6)
      )
      .foregroundColor(.black)
      .font(.body)
  }
} // RaisedButtonStyle

extension Text {
  func raisedButtonTextStyle() -> some View {
    self
    .font(.body)
    .fontWeight(.bold)
  }
} // Text

struct RaisedButton_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      RaisedButton(buttonText: "Get Started") {
        print("Hello World")
      }
      .buttonStyle(.raised)
      .padding(20)
    }
    .background(Color("background"))
    .previewLayout(.sizeThatFits)
  }
} // RaisedButton_Previews

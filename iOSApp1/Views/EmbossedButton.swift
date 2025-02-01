//
//  EmbossedButton.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//

import SwiftUI

enum EmbossedButtonShape {
  case round, capsule, roundedRectangle
} // EmbosedButtonShape

struct EmbossedButtonStyle: ButtonStyle {
  var buttonShape: EmbossedButtonShape = .capsule
  var width: CGFloat = 200
  var height: CGFloat = 50
  var fontSize: Font = .title2

  func makeBody(configuration: Configuration) -> some View {
    let baseColor = Color(red: 0.35, green: 0.18, blue: 0.05)
    let shadow = Color.black.opacity(0.9)
    let highlight = Color.white.opacity(0.6)

    return configuration.label
      .font(fontSize)
      .frame(width: width, height: height)
      .background(
        GeometryReader { geometry in
          shape(size: geometry.size)
            .foregroundColor(baseColor)
            .shadow(color: shadow, radius: 6, x: 2, y: 2)
            .shadow(color: highlight, radius: 6, x: -4, y: -4)
        })
      .foregroundColor(.white)
  } // makeBody()

  @ViewBuilder
  func shape(size: CGSize) -> some View {
    switch buttonShape {
    case .round:
      Circle()
    case .capsule:
      Capsule()
    case .roundedRectangle:
      RoundedRectangle(cornerRadius: min(size.width, size.height) * 0.3)
    }
  }
} // EmbossedButtonStyle

struct EmbossedButton_Previews: PreviewProvider {
  static var previews: some View {
    Button("Orders") {}
      .buttonStyle(EmbossedButtonStyle(buttonShape: .roundedRectangle, width: 200, height: 50, fontSize: .title))
      .padding()
      .previewLayout(.sizeThatFits)
  }
} // EmbossedButton_Previews

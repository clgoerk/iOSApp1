//
//  ContainerView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-30.
//

import SwiftUI

struct ContainerView<Content: View>: View {
  var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    ZStack {
      GradientBackground()
        .clipShape(RoundedCorner(radius: 25, corners: [.topLeft, .topRight]))
        .edgesIgnoringSafeArea(.all)
      VStack {
        content
      }
      .edgesIgnoringSafeArea(.all)
    }
  } // body
} // ContainerView

struct RoundedCorner: Shape {
  var radius: CGFloat
  var corners: UIRectCorner

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect,
                            byRoundingCorners: corners,
                            cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
} // RoundedCorner

struct Container_Previews: PreviewProvider {
  static var previews: some View {
    ContainerView {
      VStack {
        RaisedButton(buttonText: "Hello World") {}
          .padding(50)
        Button("Tap me!") {}
          .buttonStyle(EmbossedButtonStyle(buttonShape: .roundedRectangle))
      }
    }
    .previewLayout(.sizeThatFits)
  }
} // Container_Previews

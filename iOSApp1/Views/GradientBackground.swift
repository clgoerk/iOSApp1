//
//  GradientBackground.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-30.
//

import SwiftUI

struct GradientBackground: View {
  
  var gradient: Gradient {
    Gradient(colors: [
      Color("gradient-top"),
      Color("gradient-bottom")
    ])
  } // gradient
  
  var body: some View {
    LinearGradient(
      gradient: gradient,
      startPoint: .top,
      endPoint: .bottom)
  } // body
} // GradientBackground


#Preview {
    GradientBackground()
} // GradientBackground_Previews

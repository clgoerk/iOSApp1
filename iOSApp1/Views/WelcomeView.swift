//
//  WelcomeView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-22.
//

import SwiftUI

struct WelcomeView: View {
  @Binding var selectedTab: Int
  @State private var showHistory = false
  @EnvironmentObject var history: HistoryStore

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack {
          HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
            .padding(.bottom, 0)
        
          ContainerView {

            ViewThatFits {
              VStack {
                Image("WelcomeImage")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 240, height: 240)
                  .clipShape(Circle())

                Text("Coffee Run")
                  .font(.largeTitle)
                  .fontWeight(.bold)
                  .foregroundColor(.white)
                  .padding(.top, 10)

                getStartedButton

     
                Image("coffee")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 200, height: 150)
                  .padding(.top, 10)
                  .padding(.bottom, 30)

                ordersButton
                              
                Spacer()
              }
            }
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(20)
            .ignoresSafeArea()
          }
        }
        .padding(0)
      }
    }
  } // body

  var getStartedButton: some View {
    RaisedButton(buttonText: "Get Started") {
      selectedTab = 0
    }
    .frame(width: 200)
  } // getStartedButton

  var ordersButton: some View {
    embossedButton(action: {
      showHistory.toggle()
    }, label: "Orders")
    .fullScreenCover(isPresented: $showHistory) {
      HistoryView(showHistory: $showHistory)
        .background(GradientBackground().ignoresSafeArea())
    }
  } // orderButton

  func embossedButton(action: @escaping () -> Void, label: String) -> some View {
    Button(action: action) {
      Text(label)
        .font(.headline)
        .fontWeight(.bold)
        .frame(width: 200, height: 50)
    }
    .buttonStyle(EmbossedButtonStyle(buttonShape: .roundedRectangle, width: 200, height: 50, fontSize: .headline))
  } // embossedButton()
} // WelcomeView

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(9))
      .environmentObject(HistoryStore())
  }
} // WelcomeView_Previews

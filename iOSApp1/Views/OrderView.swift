//
//  OrderView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//

import SwiftUI

struct OrderView: View {
  @Binding var selectedTab: Int
  let index: Int
  let groupedOrders = Order.groupedOrders()
  @EnvironmentObject var history: HistoryStore
  @State private var showHistory = false
  @State private var itemCounts: [String: Int] = [:]
  
  var body: some View {
    let category = MenuCategory.allCases[index]
    
    ZStack {
      VStack(spacing: -10) {
        HeaderView(selectedTab: $selectedTab, titleText: category.rawValue)
          .padding(.bottom)
        
        ContainerView {
 
          VStack(spacing: 10) {
            ForEach(groupedOrders[category] ?? [], id: \.itemName) { order in
              HStack {
                Text(order.itemName)
                  .padding()
                  .font(.title3)
                  .foregroundColor(.black)
                
                Spacer()
                
                HStack(spacing: 15) {
                  // Add item button
                  addButton(for: order)
                  
                  // Counter
                  Text("\(itemCounts[order.itemName, default: 0])")
                    .font(.title2)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                  
                  // Remove item
                  removeButton(for: order)
                }
                .padding(.horizontal, 15)
              }
              .frame(maxWidth: .infinity)
              .padding(.vertical, 6)
              .background(Color.white)
              .cornerRadius(10)
              .shadow(color: Color.black.opacity(0.4), radius: 10, x: 2, y: 2)
            } // ForEach
            
            Spacer()
            
            ordersButton
              .padding(.bottom, 50)
          }
          .padding()
          .background(GradientBackground())
          .cornerRadius(20)
        }
      } // ZStack
      .onAppear {
        history.createNewOrder()
      }
    } // body
  } // OrderView
  
  func addButton(for order: Order) -> some View {
    CircleButton(buttonText: "+", action: {
      itemCounts[order.itemName, default: 0] += 1
      history.addItemToOrder(order.itemName)
    })
  } // addButton()
  
  func removeButton(for order: Order) -> some View {
    CircleButton(buttonText: "-", action: {
      itemCounts[order.itemName, default: 0] -= 1
      history.removeItemFromOrder(order.itemName)
    })
  } // removeButton()
  
  var ordersButton: some View {
    embossedButton(action: {
      showHistory.toggle()
    }, label: "Orders")
    .fullScreenCover(isPresented: $showHistory) {
      HistoryView(showHistory: $showHistory)
        .background(GradientBackground().ignoresSafeArea()) // Full coverage
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
  }
} // embossedButton()

struct OrderView_Previews: PreviewProvider {
  static var previews: some View {
    OrderView(selectedTab: .constant(0), index: 0)
      .environmentObject(HistoryStore())
  }
} // OrderView_Previews

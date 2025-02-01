//
//  HistoryView.swift
//  iOSApp1
//
//  Created by Chris Goerk on 2025-01-29.
//
import SwiftUI

struct HistoryView: View {
  @Binding var showHistory: Bool
  @EnvironmentObject var history: HistoryStore
  
  var headerView: some View {
    ZStack {
      HStack {
        Spacer()
        Text("History")
          .foregroundColor(.white)
          .font(.largeTitle)
          .fontWeight(.bold)
          .shadow(color: .black, radius: 10, x: 5, y: 5)
        
        Spacer()
      }
      
      CircleButton(buttonText: "×") {
        showHistory.toggle()
      }
      .foregroundColor(.black)
      .frame(width: 30, height: 30)
      .padding(.trailing, 25)
      .frame(maxWidth: .infinity, alignment: .trailing)
    }
    .padding() 
  } // headerView
  
  func dayView(day: OrderDay) -> some View {
    DisclosureGroup {
      orderView(day: day)
        .padding(.vertical, -5)
        .deleteDisabled(true)
    } label: {
      Text(day.date.formatted(as: "d MMM YYYY, hh:mm a"))
        .font(.headline)
    }
  } // dayView()
  
  func orderView(day: OrderDay) -> some View {
    VStack(spacing: 10) {
      ForEach(day.uniqueOrders, id: \.self) { item in
        Text(item)
          .badge(day.countOrder(order: item))
      }
    }
  } // OrderView()
  
  var body: some View {
    ZStack {
      GradientBackground()
        .ignoresSafeArea()
      VStack {
        headerView
        
        List($history.orderDays, editActions: [.delete]) { $day in
          dayView(day: day)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
        .padding(.top)
        .cornerRadius(20)
        
        Spacer()
        
        Image("WelcomeImage")
          .resizable()
          .scaledToFit()
          .frame(width: 240, height: 240)
          .clipShape(Circle())
      }
      .onDisappear {
        try? history.save()
      }
    }
  } // body
} // HistoryView

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    let historyStore = HistoryStore()
    historyStore.createDevData()

    return HistoryView(showHistory: .constant(true))
      .environmentObject(historyStore)
  }
} // HistoryView_Previews

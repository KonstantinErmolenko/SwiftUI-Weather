//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ермоленко Константин on 11.01.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack{
        LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
          .ignoresSafeArea(edges: .all)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

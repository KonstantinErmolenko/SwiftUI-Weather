//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ермоленко Константин on 11.01.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
          .ignoresSafeArea(edges: .all)
        VStack {
          Text("Cupertino, CA")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
          VStack(spacing: 10) {
            Image(systemName: "cloud.sun.fill")
              .renderingMode(.original)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 180, height: 180)
            
            Text("-12°")
              .font(.system(size: 70, weight: .medium, design: .default))
              .foregroundColor(.white)
          }
            .padding()
          Spacer()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

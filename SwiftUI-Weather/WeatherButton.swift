//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Ермоленко Константин on 12.01.2021.
//

import SwiftUI

struct WeatherButton: View {
  
  var title: String
  var bacgroundColor: Color
  var textColor: Color
  
  var body: some View {
    Text(title)
      .frame(width: 280, height: 50)
      .background(bacgroundColor)
      .foregroundColor(textColor)
      .font(.system(size: 20, weight: .medium, design: .default))
      .cornerRadius(10)
  }
}

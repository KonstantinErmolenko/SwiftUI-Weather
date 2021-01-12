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
        BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
        
        VStack {
          CityNameView(cityName: "Cupertino, CA")
          
          MainWeatherStatusView(imageName: "cloud.sun.fill",
                                temperature: -8)
          
          HStack(spacing: 20) {
            WeatherDayView(dayOfWeek: "TUE",
                           imageName: "cloud.hail.fill",
                           temperature: -15)
            WeatherDayView(dayOfWeek: "WED",
                           imageName: "sun.max.fill",
                           temperature: -11)
            WeatherDayView(dayOfWeek: "THU",
                           imageName: "wind.snow",
                           temperature: -18)
            WeatherDayView(dayOfWeek: "FRI",
                           imageName: "snow",
                           temperature: -13)
            WeatherDayView(dayOfWeek: "SAT",
                           imageName: "sun.max.fill",
                           temperature: -18)
          }

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

struct WeatherDayView: View {
  
  var dayOfWeek: String
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 20) {
      Text(dayOfWeek)
        .font(.system(size: 28, weight: .medium, design: .default))
        .foregroundColor(.white)
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      Text("\(temperature)°")
        .font(.system(size: 28, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  
  var topColor: Color
  var bottomColor: Color
  
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .ignoresSafeArea(edges: .all)
  }
}

struct CityNameView: View {
  
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
  }
}

struct MainWeatherStatusView: View {
  
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
      
      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}

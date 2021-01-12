//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ермоленко Константин on 11.01.2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isNight = false
  
  var body: some View {
    ZStack {
      BackgroundView(isNight: $isNight)
      
      VStack {
        CityNameView(cityName: "Saint Petersburg")
        MainWeatherStatusView(isNight: $isNight, temperature: -8)
        DayForecastSymbols()
        
        Spacer()
        
        Button {
          isNight.toggle()
        } label: {
          WeatherButton(title: "Change Day Time",
                        bacgroundColor: .white,
                        textColor: isNight ? .black : .blue)
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
        .font(.system(size: 23, weight: .medium, design: .default))
        .foregroundColor(.white)
      
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      
      Text("\(temperature)°")
        .font(.system(size: 23, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  
  @Binding var isNight: Bool
  
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                               isNight ? .gray : Color("lightBlue")]),
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
      .padding()
  }
}

struct MainWeatherStatusView: View {
  
  @Binding var isNight: Bool
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
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

struct DayForecastSymbols: View {
  var body: some View {
    HStack(spacing: 26) {
      WeatherDayView(dayOfWeek: "TUE",
                     imageName: "cloud.hail.fill",
                     temperature: -15)
      WeatherDayView(dayOfWeek: "WED",
                     imageName: "sun.max.fill",
                     temperature: -11)
      WeatherDayView(dayOfWeek: "THU",
                     imageName: "wind.snow",
                     temperature: -10)
      WeatherDayView(dayOfWeek: "FRI",
                     imageName: "snow",
                     temperature: -13)
      WeatherDayView(dayOfWeek: "SAT",
                     imageName: "sun.max.fill",
                     temperature: -16)
    }
  }
}

//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ермоленко Константин on 11.01.2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isNight = false
  @State var forecasts: [WeatherForecast]
  
  var body: some View {
    ZStack {
      BackgroundView(isNight: $isNight)
      
      VStack {
        CityNameView(cityName: "Saint Petersburg")
        MainWeatherStatusView(isNight: $isNight, temperature: -8)
        ForecastFeed(forecasts: $forecasts)
        
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
    let forecasts = [
      WeatherForecast(dayOfWeek: "TUE",
                      imageName: "cloud.hail.fill",
                      temperature: -9),
      WeatherForecast(dayOfWeek: "WED",
                      imageName: "sun.max.fill",
                      temperature: -11),
      WeatherForecast(dayOfWeek: "THU",
                      imageName: "wind.snow",
                      temperature: -10),
      WeatherForecast(dayOfWeek: "FRI",
                      imageName: "snow",
                      temperature: -9),
      WeatherForecast(dayOfWeek: "SAT",
                      imageName: "sun.max.fill",
                      temperature: -7)
    ]
    ContentView(forecasts: forecasts)
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

struct ForecastFeed: View {
  
  @Binding var forecasts: [WeatherForecast]
  
  var body: some View {
    HStack(spacing: 26) {
      ForEach(forecasts, id: \.self) { forecast in
        WeatherDayView(dayOfWeek: forecast.dayOfWeek,
                       imageName: forecast.imageName,
                       temperature: forecast.temperature)
      }
    }
  }
}

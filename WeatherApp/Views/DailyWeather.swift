//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Paolo on 17/08/21.
//

import SwiftUI

struct DailyWeather: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        ForEach(cityViewModel.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: WeatherDaily) -> some View {
        HStack {
            Text(cityViewModel.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Text("\(cityViewModel.getTempFor(temp: weather.temp.max)) | \(cityViewModel.getTempFor(temp: weather.temp.min)) ℃")
                .frame(width: 150)
            Spacer()
            cityViewModel.getWeatherIconFor(icon: weather.weather[0].icon)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050806046, green: 0.8078469634, blue: 0.9820559621, alpha: 1)), Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]),
                                startPoint: .topLeading, endPoint: .bottomTrailing
                            )))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct DailyWeather_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeather(cityViewModel: CityViewModel())
    }
}

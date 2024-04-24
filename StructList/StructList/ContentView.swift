//
//  ContentView.swift
//  StructList
//
//  Created by Jungjin Park on 2024-04-24.
//

import SwiftUI

struct ContentView: View {
    var weatherData: [WeatherInfo]
    var body: some View {
        List {
            ForEach(weatherData) { weather in
                WeatherRow(weather: weather)
            }
        }
    }
}

#Preview {
    ContentView(weatherData: WeatherInfo.weatherData)
}

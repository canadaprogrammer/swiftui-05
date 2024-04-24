//
//  StructListApp.swift
//  StructList
//
//  Created by Jungjin Park on 2024-04-24.
//

import SwiftUI

@main
struct StructListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(weatherData: WeatherInfo.weatherData)
        }
    }
}

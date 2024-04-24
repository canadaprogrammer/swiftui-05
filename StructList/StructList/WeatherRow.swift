//
//  WeatherRow.swift
//  StructList
//
//  Created by Jungjin Park on 2024-04-24.
//

import SwiftUI

struct WeatherRow: View {
    var weather: WeatherInfo
    var body: some View {
        HStack {
            Image(systemName: weather.image)
                .frame(width: 50, alignment: .leading)
            Text("\(weather.temp)°F")
                .frame(width: 60, alignment: .leading)
            Text(weather.city)
        }
        .font(.system(size: 20))
        .padding([.top, .bottom], 5)
    }
}

#Preview {
    WeatherRow(weather: WeatherInfo(image: "snow", temp: 5, city: "New York"))
}

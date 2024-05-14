//
//  ContentView.swift
//  WeatherApp https://www.youtube.com/watch?v=ttzCue82nE4&list=PLVcEZG2JPVhcMJfVsMy0w1FbnAQVoGUy9&index=101
//
//  Created by Gloria Villa on 1/14/24.
//
import CoreLocation
import SwiftUI
import WeatherKit

struct ContentView: View {
    @State private var currentSymbol: String?
    @State private var conditions: String?
    var body: some View {
        ScrollView {
           VStack {
               if currentSymbol != nil {
                    Image(systemName:"currentSymbol")
                        .font(.system(size: 200, weight:.light))
                }
                
                if let conditions {
                    Text(conditions)
                        .font(.title)
                }
                
                
            }
           .frame(maxWidth:.infinity)
           
        }
        .background(.linearGradient(colors: [.blue, Color(hue: 0.6, saturation: 0.8, brightness: 0.5)], startPoint: .top, endPoint:.bottom))
        .task{
            loadWeather()
        }
    }
    func loadWeather() {
        Task {
            let location = CLLocation(latitude: 47.60, longitude: -122.33)
            //let weather = try await WeatherService.shared.weather(for: location)
            let weather = try await WeatherService.shared.weather(for: location)
            
            currentSymbol = weather.currentWeather.symbolName
            conditions = weather.currentWeather.condition.description
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

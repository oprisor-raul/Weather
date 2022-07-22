//
//  ContentView.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 15.07.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WheaterManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if locationManager.location != nil {
                //                Location shared and all information gathered
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else {
                    //                    Loading weather
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(
                                    latitude: locationManager.location!.latitude,
                                    longitude: locationManager.location!.longitude)
                            }
                            catch {
                                print("Error fetching data.")
                            }
                        }
                }
            }
            else {
                if locationManager.isloading {
                    //                    Loading location
                    LoadingView()
                } else {
                    //                    WelcomeView asking for the location
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UIConstants {
    static let primaryColor = Color(.white)
    static let secondaryColor = Color(.gray)
}

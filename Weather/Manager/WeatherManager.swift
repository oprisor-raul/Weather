//
//  File.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 15.07.2022.
//

// Open Weather API Key:= from website (https://home.openweathermap.org/users/sign_up)
let openWeatherAPIKEY = "cb49b51d3aa9c53b7082afdf4a577572"

import Foundation
import CoreLocation

class WheaterManager {
    //    Calls Open Weather API and gets all the data for current latitude and longitude and throws error in case of an error
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(openWeatherAPIKEY)&units=metric")
        else {
            fatalError("URL ERROR")}
        let urlRequest = URLRequest(url: url)
        let (data, respone) = try! await URLSession.shared.data(for: urlRequest)
        guard (respone as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error loading data") }
        let decodedData = try! JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
    }
}

struct ResponseBody: Decodable {
    //    Sample data of informations included in an API call in ("Preview Content"->"weatherData")
    //    Response is a collection of all the vital data reported after an API call
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var sys: SystemResponse
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    struct SystemResponse: Decodable {
        var  type: Double
        var id: Double
        var country: String
        var sunrise: Double
        var sunset: Double
    }
}

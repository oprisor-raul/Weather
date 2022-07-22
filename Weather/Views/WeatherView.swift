//
//  WeatherView.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 18.07.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(){
                LocationAndDate
                Temperature
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Image(getBackgorundImage())
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        moreInformation
            .frame(maxHeight: 40)
    }
    
    var LocationAndDate: some View {
        //        Location and Date Information View
        VStack(alignment: .leading, spacing: 5)
        {
            Text(weather.name)
                .bold()
                .font(.title)
            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
        }
        .foregroundColor(UIConstants.primaryColor)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var Temperature: some View {
        //        SF Symbol of current condition and a brief description
        //        The actual temperature
        VStack {
            HStack {
                VStack(spacing: 20){
                    let emojiWeather = getEmoji()
                    Image(systemName: emojiWeather + ".fill")
                        .font(.system(size: 40))
                    Text(weather.weather[0].main)
                }
                .frame(width: 150, alignment: .leading)
                
                Spacer()
                
                Text(weather.main.temp.roundDouble()+"°")
                    .font(.system(size: 65))
                    .fontWeight(.bold)
                    .padding()
            }
        }
        .foregroundColor(UIConstants.primaryColor)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var moreInformation: some View {
        //        More Information displayed at the bottom of the screen using "WeatherIconInformation"
        VStack {
            HStack {
                Text("Weather now:").frame(alignment: .bottom)
                if (UIScreen.main.bounds.size.width < 600) {
                    Spacer()
                }
            }
            if (UIScreen.main.bounds.size.width < 600) {
                iPhoneIcons
            }
            else {
                largeDeviceIcons
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom, 160)
        .foregroundColor(UIConstants.primaryColor)
        .background(getBackgroundColor())
        .corneRadius(20, corners: [.topLeft, .topRight])
    }
    
    var iPhoneIcons: some View {
        VStack {
            HStack {
                sunrise
                Spacer()
                sunset
            }
            HStack {
                wind
                Spacer()
                feels_like
            }
        }
    }
    
    var largeDeviceIcons: some View {
        HStack{
            sunrise
            Spacer()
            sunset
            Spacer()
            wind
            Spacer()
            feels_like
        }
    }
    
    var sunrise: some View {
        WeatherIconInformation(logo:"sunrise.fill",
                               name:"Sunrise",
                               value:
                                "\(Date(timeIntervalSince1970:weather.sys.sunrise).formatted(.dateTime.hour().minute()))")
    }
    
    var sunset: some View {
        WeatherIconInformation(logo:"sunset.fill",
                               name:"Sunset",
                               value: "\(Date(timeIntervalSince1970:weather.sys.sunset).formatted(.dateTime.hour().minute()))")
    }
    
    var wind: some View {
        WeatherIconInformation(logo:"wind",
                               name:"Wind",
                               value: "\(weather.wind.speed) m/s")
    }
    
    var feels_like: some View {
        WeatherIconInformation(logo:"thermometer",
                               name:"Feels Like",
                               value: "\(weather.main.feels_like.roundDouble())°‎"+addSpace())
    }
    
    func addSpace() -> String {
        //        Adds space so the icons are displayed aligned depending on the device's time settings (24-Hour Format or 12-Hour Format)
        let dateFormat = DateFormatter.dateFormat (fromTemplate: "j",options:0, locale: Locale.current)
        
        var is24Hour = true
        if dateFormat == "h a" {
            is24Hour = false
        }
        
        if is24Hour {
            return ""
        }
        else {
            return " ‎ ‎  ‎ ‎ㅤㅤㅤ ‎  "
        }
    }
    
    //    Description of following functions in the "IconManager"
    func getBackgorundImage() -> String {
        return getIconBackgorundImage(weatherIcon: weather.weather[0].icon)
    }
    
    func getEmoji() -> String {
        return getIconEmoji(weatherIcon: weather.weather[0].icon)
    }
    
    func getBackgroundColor() -> Color {
        return(getIconBackgroundColor(icon: weather.weather[0].icon))
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
            .previewInterfaceOrientation(.portrait)
    }
}

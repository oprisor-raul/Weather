//
//  IconManger.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 19.07.2022.
//

import Foundation
import SwiftUI
// The following functions are used to convert Open Weather's public API icons into useful data later displayed in the UI, depending on the weather conditions

func getIconBackgorundImage(weatherIcon: String) -> String {
    //    Background Image depending on the weather condition and screen size (All Images found in "Assets")
    let screenRect = UIScreen.main.bounds
    var DeviceIsiPhone = false
    if (screenRect.size.width < 600) {
        DeviceIsiPhone = true
    }
    
    if (weatherIcon == "01d") {
        return "clearSkyDay"
    }
    if (weatherIcon == "01n") {
        if DeviceIsiPhone {
            return "clearSkyNightiPhone"
        }
        return "clearSkyNight"
    }
    else if (weatherIcon == "02d") {
        return "fewCloudsSkyDay"
    }
    else if (weatherIcon == "02n") {
        if DeviceIsiPhone {
            return "fewCloudsSkyNightiPhone"
        }
        return "cloudsNight"
    }
    else if (weatherIcon == "03d") {
        return "scatteredCloudsSkyDay"
    }
    else if (weatherIcon == "03n") {
        if DeviceIsiPhone {
            return "scatteredCloudsSkyNightiPhone"
        }
        return "cloudsNight"
    }
    else if (weatherIcon == "04d") {
        return "brokenCloudsSkyDay"
    }
    else if (weatherIcon == "04n") {
        return "cloudsNight"
    }
    else if (weatherIcon == "09d") {
        if DeviceIsiPhone {
            return "rainSkyDayiPhone"
        }
        return "rainSkyDay"
    }
    else if (weatherIcon == "09n") {
        if DeviceIsiPhone {
            return "rainSkyNightiPhone"
        }
        return "rainSkyNight"
    }
    else if (weatherIcon == "10d") {
        if DeviceIsiPhone {
            return "rainSkyDayiPhone"
        }
        return "rainSkyDay"
    }
    else if (weatherIcon == "10n") {
        if DeviceIsiPhone {
            return "rainSkyNightiPhone"
        }
        return "rainNightNight"
    }
    else if (weatherIcon == "11d") {
        if DeviceIsiPhone {
            return "lightningSkyDayiPhone"
        }
        return "lightningSkyDay"
    }
    else if (weatherIcon == "11n") {
        return "lightningSkyNight"
    }
    else if (weatherIcon == "13d") {
        return "snow"
    }
    else if (weatherIcon == "13n") {
        return "snowNight"
    }
    else if (weatherIcon == "50d") {
        return "mist"
    }
    else if (weatherIcon == "50n") {
        return "mist"
    }
    else if (weatherIcon.last == "n") {
        return "clearSkyNight"
    }
    return "clearSkyDay"
}

func getIconEmoji(weatherIcon: String) -> String {
    //    Open Weather API to SF Symbol "translator"
    if (weatherIcon == "01d") {
        return "sun.max"
        //            􀆭
    }
    else if (weatherIcon == "01n") {
        return "moon"
        //              􀆹
    }
    else if (weatherIcon == "02d") {
        return "cloud.sun"
        //            􀇔
    }
    else if (weatherIcon == "02n") {
        return "cloud.moon"
        //            􀇚
    }
    else if (weatherIcon == "03d") {
        return "cloud"
        //            􀇂
    }
    else if (weatherIcon == "03n") {
        return "cloud"
        //            􀇂
    }
    else if (weatherIcon == "04d") {
        return "smoke"
        //            􀇢
    }
    else if (weatherIcon == "04n") {
        return "smoke"
        //            􀇢
    }
    else if (weatherIcon == "09d") {
        return "cloud.rain"
        //            􀇆
    }
    else if (weatherIcon == "09n") {
        return "cloud.rain"
        //            􀇆
    }
    else if (weatherIcon == "10d") {
        return "cloud.sun.rain"
        //            􀇖
    }
    else if (weatherIcon == "10n") {
        return "cloud.moon.rain"
        //            􀇜
    }
    else if (weatherIcon == "11d") {
        return "cloud.bolt.rain"
        //            􀇞
    }
    else if (weatherIcon == "11n") {
        return "cloud.bolt.rain"
        //            􀇞
    }
    else if (weatherIcon == "13d") {
        return "cloud.snow"
        //            􀇎
    }
    else if (weatherIcon == "13n") {
        return "cloud.snow"
        //            􀇎
    }
    else if (weatherIcon == "50d") {
        return "cloud.fog"
        //            􀇊
    }
    else if (weatherIcon == "50n") {
        return "cloud.fog"
        //            􀇊
    }
    else {
        return "sun.max"
    }
}

func getIconBackgroundColor(icon: String) -> Color {
    //  Coloring the bottom view depending on the color of the background (chosen by the weather conditions)
    if (icon.last == "n") {
        if (icon == "03n" || icon == "13n" || icon == "50n") {
            return Color(red: (0/255.0), green: (0/255.0), blue: (25/255.0))
        }
        return Color(.black)
    }
    else {
        if (icon == "09d"  || icon == "10d" || icon == "10d" ) {
            return Color(red: (105/255.0), green: (105/255.0), blue: (105/255.0))
        }
        if (icon == "13d" || icon == "50d") {
            return Color(red: (0/255.0), green: (0/255.0), blue: (40/255.0))
        }
        return Color(red: (37/255.0), green: (150/255.0), blue: (190/255.0))
    }
}

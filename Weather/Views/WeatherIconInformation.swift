//
//  WeatherIcon.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 18.07.2022.
//

import SwiftUI

struct WeatherIconInformation: View {
    //    Small round Icon Displayed at the bottom of the screen with data (eg. sunset)
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing:20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(UIConstants.secondaryColor)
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title3)
            }
        }
    }
}

struct WeatherIcon_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconInformation(logo: "thermometer", name: "Feels like", value: "23°")
    }
}


//
//  WelcomeView.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 15.07.2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    //    Simple Welcome View that asks for permission to get the devices current location
    @EnvironmentObject var locationManager : LocationManager
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Text("Wheather App")
                    .bold().font(.title)
                Text("Share your current location to fetch the weather information for your current area.")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .foregroundColor(.white)
            .cornerRadius(30)
            .symbolVariant(.fill)
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

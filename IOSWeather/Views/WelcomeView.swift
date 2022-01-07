//
//  WelcomeView.swift
//  IOSWeather
//
//  Created by Oluwayomi M on 2022-01-06.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome To The Weather App")
                    .bold().font(.title)
                
                Text("Please Share you current location to get the current weather in your location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
        }.frame(maxWidth:.infinity , maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

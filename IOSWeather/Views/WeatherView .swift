//
//  WeatherView .swift
//  IOSWeather
//
//  Created by Oluwayomi M on 2022-01-06.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name).bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }.frame(width: 150, alignment: .leading )
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer().frame( height: 80)
//
                    let url = URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")
                    AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode:
                                                    .fit)
                                .frame(width: 350)
        
                        } placeholder: {
                            ProgressView()
                        }
                    Spacer()
                    
                    
//                    AsyncImage(url: URL(string: "")) { image in
//                        image
//                            .resizeable
//                            .aspectRatio(contentMode:
//                                                .fit)
//                            .frame(width: 350)
//                    }placeholder: {
//                        ProgressView()
//                    }
                }
                .frame(maxWidth: .infinity)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundtToOne() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth : .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(.black))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }.edgesIgnoringSafeArea(.bottom)
            .background(.black)
            .preferredColorScheme(.dark)
    }
}

struct WeatherView__Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

//
//  CityViewModel.swift
//  Weather
//
//  Created by MV on 2022. 12. 13..
//

import UIKit

struct CityViewModel {

    let weatherData: WeatherData
    
    var cityName: String {
        return weatherData.name + " - " + weatherData.sys.country
    }
    
    var description: String {
        return weatherData.weather[0].weatherDescription
    }
    
    var humidity: String {
        let humidity = weatherData.main.humidity
        return "label_humidity".localized() + "\n\(humidity)" + " %"
    }
    
    var windSpeed: String {
        let windSpeed = weatherData.wind.speed
        let kph = String(format: "%.f km/h", windSpeed.toKph)
        return "label_wind".localized() + "\n\(kph)"
    }
    
    var image: UIImage? {
        UIImage.iconCodeForImage(name: weatherData.weather[0].icon)
    }
    
    var sunrise: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = WDateFormat.hourminutes
        let date = Date(timeIntervalSince1970: TimeInterval(weatherData.sys.sunrise))
        let dfDate = dateFormatter.string(from: date)
        return "label_sunrise".localized() + "\(dfDate)"
    }
    
    var sunset: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = WDateFormat.hourminutes
        let date = Date(timeIntervalSince1970: TimeInterval(weatherData.sys.sunset))
        let dfDate = dateFormatter.string(from: date)
        return "label_sunset".localized() + "\(dfDate)"
    }
    
}

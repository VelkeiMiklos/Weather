//
//  WeatherCityUrl.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import Foundation

struct WeatherCityUrl {
    
    // MARK: - Variables
    private let apiKey  = "7dfff4e8ddf057a3b98dd6da3b9a0ed2"
    private let baseUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    let city            : String
    
    var url: URL {
        
        //URL components
        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else {
            fatalError("Something happened with the base url")
        }
        
        //Query Items
        components.queryItems = [
            URLQueryItem(name: WQuerry.query, value: "\(city)" + WQuerry.country_code_hu),
            URLQueryItem(name: WQuerry.appid, value: apiKey)
        ]
        
        //Url
        guard let url = components.url else {
            fatalError("Something happened with the query")
        }
        
        return url
    }
    
}

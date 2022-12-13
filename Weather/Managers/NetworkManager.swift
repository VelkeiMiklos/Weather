//
//  NetworkManager.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import UIKit

class NetworkManager {
    
    //MARK: - Variables
    static let shared = NetworkManager()
    
    //MARK: - Init
    private init() {}
    
    //MARK: - Methods
    func fetchWeatherData(city: String, completed: @escaping (Result<WeatherData, WError>) -> Void) {
        
        let url = WeatherCityUrl(city: city).url

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.errorOccured))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder       = JSONDecoder()
                let weatherData   = try decoder.decode(WeatherData.self, from: data)
                completed(.success(weatherData))
            } catch {
                completed(.failure(.invalidData))
            }

        }
        task.resume()
        
    }

}

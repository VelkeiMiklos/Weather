//
//  CityData.swift
//  Weather
//
//  Created by MV on 2022. 12. 12..
//

import Foundation

struct Cities: Codable {
    let cities: [City]
}

struct City: Codable {
    let city, county: String
}


//
//  City.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import Foundation

struct City: Decodable {
    let name: String
    let localNames: [String: String]?
    let latitude: Double
    let longitude: Double
    let country: String
    let state: String?
}

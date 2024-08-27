//
//  APIClient.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import Foundation

protocol APIClient {
    func cities(for name: String) -> Result<[City], Error>
}

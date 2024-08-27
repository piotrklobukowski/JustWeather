//
//  CitySearchViewModelImpl.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import Foundation

final class CitySearchViewModelImpl: CitySearchViewModel {
    private var cities: [City] = []
    private var error: Error? = nil
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func search(for city: String) {
        let result = apiClient.cities(for: city)
        do {
            cities = try result.get()
        } catch {
            self.error = error
        }
    }
    
    func numberOfRows() -> Int {
        if error != nil {
            return 1
        } else {
            return cities.count
        }
    }
}

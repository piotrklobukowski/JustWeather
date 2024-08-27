//
//  CitySearchViewModelImpl.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import Foundation

final class CitySearchViewModelImpl: CitySearchViewModel {
    private var cities: [City] = []
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func search(for city: String) {
        let result = apiClient.cities(for: city)
        cities = try! result.get()
    }
    
    func numberOfRows() -> Int {
        return cities.count
    }
}

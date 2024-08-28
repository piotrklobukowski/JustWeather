//
//  CityTableViewCellViewModelImpl.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import Foundation

final class CityTableViewCellViewModelImpl: CityTableViewCellViewModel {
    private let city: City
    
    init(city: City) {
        self.city = city
    }
    
    func text() -> String {
        var elements = [city.name, city.country]
        if let state = city.state {
            elements.append(state)
        }
        return elements.joined(separator: ", ")
    }
}

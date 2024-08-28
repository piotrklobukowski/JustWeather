//
//  CitySearchViewModel.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import Foundation

protocol CitySearchViewModel {
    func search(for city: String)
    func numberOfRows() -> Int
    func cellViewModel(for row: Int) -> CityTableViewCellViewModel
}

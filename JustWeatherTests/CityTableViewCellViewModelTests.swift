//
//  CityTableViewCellViewModelTests.swift
//  JustWeatherTests
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import XCTest
@testable import JustWeather

final class CityTableViewCellViewModelTests: XCTestCase {
    
    var sut: CityTableViewCellViewModel?

    override func setUpWithError() throws {
        sut = CityTableViewCellViewModelImpl(city: City(name: "Warsaw", localNames: ["pl": "Warszawa", "en": "Warsaw"], latitude: 0.0, longitude: 0.0, country: "PL", state: "Masovian Voivodeship"))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_text_ShouldReturnCityNameCountryCodeAndState() {
        guard let sut else {
            fatalError("System under test hasn't set")
        }
        let text = sut.text()
        XCTAssertEqual(text, "Warsaw, PL, Masovian Voivodeship")
    }
}

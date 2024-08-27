//
//  CitySearchViewModelTests.swift
//  JustWeatherTests
//
//  Created by Piotr Kłobukowski on 27/08/2024.
//

import XCTest
@testable import JustWeather

final class CitySearchViewModelTests: XCTestCase {
    
    var sut: CitySearchViewModel?

    override func setUpWithError() throws {
        sut = CitySearchViewModelImpl(apiClient: StubAPIClient())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_searchForCity_WhenInputIsValid_ShouldReturnCorrectNumberOfRows() {
        sut?.search(for: "London")
        XCTAssertEqual(sut?.numberOfRows(), 4)
    }
}

final class StubAPIClient: APIClient {
    let data = [
        City(name: "London",
             localNames: ["en": "London",],
             latitude: 0.0,
             longitude: 0.0,
             country: "GB",
             state: "England"
            ),
        City(name: "City of London",
             localNames: ["en": "City of London"],
             latitude: 0.0,
             longitude: 0.0,
             country: "GB",
             state: "England"
            ),
        City(name: "London",
             localNames: ["en": "London"],
             latitude: 0.0,
             longitude: 0.0,
             country: "CA",
             state: "Ontario"
            ),
        City(name: "London",
             localNames: nil,
             latitude: 0.0,
             longitude: 0.0,
             country: "US",
             state: "Kentucky"
            ),
        City(name: "Warszawa",
             localNames: ["pl": "Warszawa"],
             latitude: 0.0,
             longitude: 0.0,
             country: "PL",
             state: "Greater Poland Voivodeship"
            )
    ]
    
    func cities(for name: String) -> Result<[City], Error> {
        return .success(data.filter { city in
            city.name.contains(name)
        })
    }
}

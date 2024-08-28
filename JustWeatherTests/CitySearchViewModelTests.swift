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

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_searchForCity_WhenInputIsValid_ShouldReturnFourAsNumberOfRows() {
        sut = CitySearchViewModelImpl(apiClient: StubAPIClient(hasError: false))
        sut?.search(for: "London")
        XCTAssertEqual(sut?.numberOfRows(), 4)
    }
    
    func test_searchForCity_WhenAPIErrorOccured_ShouldReturnOneAsNumberOfRows() {
        sut = CitySearchViewModelImpl(apiClient: StubAPIClient(hasError: true))
        sut?.search(for: "London")
        XCTAssertEqual(sut?.numberOfRows(), 1)
    }
    
    func test_searchForCity_WhenInputIsValid_ShouldReturnCityNameCountryCodeAndStateForFirstResult() {
        sut = CitySearchViewModelImpl(apiClient: StubAPIClient(hasError: false))
        guard let sut else { fatalError("System under test hasn't set") }
        sut.search(for: "London")
        XCTAssertEqual(sut.cellViewModel(for: 0).text(), "London, GB, England")
    }
}

final class StubAPIClient: APIClient {
    let hasError: Bool
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
        City(name: "Warsaw",
             localNames: [
                "pl": "Warszawa",
                "en": "Warsaw"
                         ],
             latitude: 0.0,
             longitude: 0.0,
             country: "PL",
             state: "Masovian Voivodeship"
            )
    ]
    
    init(hasError: Bool) {
        self.hasError = hasError
    }
    
    func cities(for name: String) -> Result<[City], Error> {
        if hasError {
            return .failure(URLError(URLError.Code.notConnectedToInternet))
        } else {
            return .success(data.filter { city in
                city.name.contains(name)
            })
        }
    }
}

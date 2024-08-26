//
//  CitySearchViewController.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 26/08/2024.
//

import UIKit

class CitySearchViewController: UIViewController {

    let searchViewController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAppearance()
        setupSearchViewController()
    }
    
    private func setupNavigationBarAppearance() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "JustWeather"
    }
    
    private func setupSearchViewController() {
        searchViewController.searchBar.placeholder = "Type city name here"
        searchViewController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchViewController
    }
}

extension CitySearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

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
        title = Constants.navigationBarTitle
    }
    
    private func setupSearchViewController() {
        searchViewController.searchBar.placeholder = Constants.searchBarPlaceholder
        searchViewController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchViewController
    }
}

extension CitySearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

//
//  CitySearchViewController.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 26/08/2024.
//

import UIKit
import SnapKit

class CitySearchViewController: UIViewController {

    let tableView = UITableView()
    let searchViewController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAppearance()
        setupSearchViewController()
        setupTableView()
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
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CitySearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

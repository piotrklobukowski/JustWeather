//
//  MainCoordinator.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 24/08/2024.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CitySearchViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}

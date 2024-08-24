//
//  Coordinator.swift
//  JustWeather
//
//  Created by Piotr Kłobukowski on 24/08/2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

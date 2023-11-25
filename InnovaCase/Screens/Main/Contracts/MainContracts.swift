//
//  MainContracts.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import UIKit

protocol MainPresenterInterface {
    var view: MainViewInterface? { get set }
    var interactor: MainInteractorInterface? { get set }
    var router: MainRouterInterface? { get set }
    func viewDidLoad()
}
protocol MainInteractorInterface {
    var presenter: MainPresenterInterface? { get set }
    var weatherResponse: WeatherResponse? { get set }
}
protocol MainInteractorOutput: AnyObject {

}
protocol MainViewInterface: AnyObject {
  var presenter: MainPresenterInterface? { get set }
  func reloadData()
}
protocol MainRouterInterface {
    var navigationController: UINavigationController? { get set }
    static func createModule(using navigationController: UINavigationController) -> UIViewController
}

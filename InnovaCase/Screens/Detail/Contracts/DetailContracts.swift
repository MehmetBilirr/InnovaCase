//
//  DetailContracts.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 26.11.2023.
//

import UIKit

protocol DetailPresenterInterface {
  var view: DetailViewInterface? { get set }
  var interactor: DetailInteractorInterface? { get set }
  var router: DetailRouterInterface? { get set }
  var weather: Weather? { get set }
  func viewDidLoad()
}

protocol DetailInteractorInterface {
  var presenter: DetailInteractorOutput? { get set }
}

protocol DetailInteractorOutput: AnyObject {

}

protocol DetailViewInterface: AnyObject {
  var presenter: DetailPresenterInterface? { get set }
  func configureView(weather: Weather)

}

protocol DetailRouterInterface {
  static func createModule(using navigationController: UINavigationController, weather: Weather) -> UIViewController
}

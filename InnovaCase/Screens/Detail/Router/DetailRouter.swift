//
//  DetailRoutr.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 26.11.2023.
//

import UIKit

class DetailRouter:DetailRouterInterface {


  var navigationController: UINavigationController?

  init(navigationController: UINavigationController) {
      self.navigationController = navigationController
  }
  static func createModule(using navigationController: UINavigationController, weather: Weather) -> UIViewController {
    let view = DetailViewController.instantiate(name: .detail)
    let presenter = DetailPresenter()
    let interactor = DetailInteractor()
    view.presenter = presenter
    view.presenter?.interactor = interactor
    view.presenter?.interactor?.presenter = presenter
    view.presenter?.view = view
    view.presenter?.router = DetailRouter(navigationController: navigationController)
    view.presenter?.weather = weather
    return view
  }
}

//
//  MainRouter.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import UIKit

class MainRouter:MainRouterInterface {
  weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  static func createModule() -> UINavigationController {
    let view = MainViewController.instantiate(name: .main)
    let presenter = MainPresenter()
    let interactor = MainInteractor()
    let router = MainRouter(navigationController: UINavigationController(rootViewController: view))
    view.presenter = presenter
    view.presenter?.interactor = interactor
    view.presenter?.router = router
    view.presenter?.interactor?.presenter = presenter
    view.presenter?.view = view
    return router.navigationController ?? UINavigationController()
  }

  func showDetail(with weather: Weather) {
    guard let navigationController = navigationController else { return }
    let detailVC = DetailRouter.createModule(using: navigationController, weather: weather)
    DispatchQueue.main.async {
        self.navigationController?.pushViewController(detailVC, animated: true)

    }
  }
}


//
//  MainRouter.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import UIKit

class MainRouter:MainRouterInterface {
  var navigationController: UINavigationController?

  static func createModule(using navigationController: UINavigationController) -> UIViewController {
    let view = MainViewController.instantiate()
    let presenter = MainPresenter()
    let interactor = MainInteractor()
    let router = MainRouter()
    view.presenter = presenter
    view.presenter?.interactor = interactor
    view.presenter?.router = router
    view.presenter?.interactor?.presenter = presenter
    view.presenter?.view = view
    return view
  }

}

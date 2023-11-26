//
//  DetailPresenter.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 26.11.2023.
//

import Foundation

class DetailPresenter: DetailPresenterInterface {
  weak var view: DetailViewInterface?
  var interactor: DetailInteractorInterface?
  var router: DetailRouterInterface?
  var weather: Weather?

  func viewDidLoad() {
    guard let weather = weather else { return }
    view?.configureView(weather: weather)
  }

}

extension DetailPresenter:DetailInteractorOutput {
  
}

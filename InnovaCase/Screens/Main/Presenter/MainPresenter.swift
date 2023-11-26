//
//  MainPresenter.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

class MainPresenter: MainPresenterInterface {
  weak var view: MainViewInterface?
  var interactor: MainInteractorInterface?
  var router: MainRouterInterface?
  var weatherResponse: WeatherResponse? {
      return UserDefaults.standard.getCacheModels()
  }
  func viewDidLoad() {
    view?.configureTableView()
    view?.configureLocationManager()
    view?.configureSearchController()
    guard let weatherResponse = weatherResponse else {return}
    view?.configureView(response: weatherResponse)
  }

  func getUserLocationWeather(location: Coord,weatherUnit: WeatherUnit) {
    interactor?.getUserLocationWeather(location: location,weatherUnit: weatherUnit)
  }

  func getWeather(at indexpath: IndexPath) -> Weather? {
    guard let weatherList = weatherResponse?.list else { return nil}
    return weatherList[indexpath.row]
  }

  func getWeatherCount() -> Int? {
    guard let weatherList = weatherResponse?.list else {return nil}
    return weatherList.count
  }
  
  func getSearchCityWeather(city: String,weatherUnit: WeatherUnit) {
    interactor?.getSearchCityWeather(city: city, weatherUnit: weatherUnit)
  }

  func goToDetail(with indexPath: IndexPath) {
    guard let weatherList = weatherResponse?.list else { return }
    router?.showDetail(with: weatherList[indexPath.row])
  }
}

extension MainPresenter: MainInteractorOutput {
  func didFetchWeather() {
    guard let weatherResponse = weatherResponse else { return }
    view?.configureView(response: weatherResponse)
    view?.reloadData()
  }
  func showAlert(message: String) {
    view?.showAlert(message: message)
  }
}

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
  var weatherResponse: WeatherResponse? { get }
  func viewDidLoad()
  func getUserLocationWeather(location: Coord,weatherUnit: WeatherUnit)
  func getWeather(at indexpath:IndexPath) -> Weather?
  func getWeatherCount() -> Int?
  func getSearchCityWeather(city: String,weatherUnit: WeatherUnit)
  func goToDetail(with indexPath: IndexPath)
}

protocol MainInteractorInterface {
  var presenter: MainInteractorOutput? { get set }
  func getUserLocationWeather(location: Coord,weatherUnit: WeatherUnit)
  func getSearchCityWeather(city: String,weatherUnit: WeatherUnit)
}

protocol MainInteractorOutput: AnyObject {
  func didFetchWeather()
  func showAlert(message: String)
}

protocol MainViewInterface: AnyObject {
  var presenter: MainPresenterInterface? { get set }
  func configureLocationManager()
  func configureTableView()
  func configureSearchController()
  func reloadData()
  func configureView(response:WeatherResponse)
  func showAlert(message: String)
}

protocol MainRouterInterface {
  var navigationController: UINavigationController? { get set }
  static func createModule() -> UINavigationController
  func showDetail(with weather: Weather)
}

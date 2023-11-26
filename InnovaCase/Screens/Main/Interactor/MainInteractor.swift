//
//  MainInteractor.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

class MainInteractor: MainInteractorInterface {
  var presenter: MainInteractorOutput?

  func getUserLocationWeather(location: Coord, weatherUnit: WeatherUnit) {
    NetworkManager.shared.getWeather(coord: location, unit: weatherUnit) {  result in
      switch result {
      case .success(let success):
        guard success.cod != "404" else {
          self.presenter?.showAlert(message: "City not found.")
          return
        }
        UserDefaults.standard.saveModeltoCache(success)
        self.presenter?.didFetchWeather()
      case .failure(let failure):
        self.presenter?.showAlert(message: failure.localizedDescription)
      }
    }
  }

  func getSearchCityWeather(city: String,weatherUnit: WeatherUnit) {
    NetworkManager.shared.getCityWeather(city: city, unit: weatherUnit) { result in
      switch result {
      case .success(let success):
        guard success.cod != "404" else { self.presenter?.showAlert(message: "City not found.")
          return }
        UserDefaults.standard.saveModeltoCache(success)
        self.presenter?.didFetchWeather()
      case .failure(let failure):
        self.presenter?.showAlert(message: failure.localizedDescription)
      }
    }
  }
}

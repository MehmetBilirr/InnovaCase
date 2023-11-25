//
//  NetworkManager.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

protocol NetworkManagerInterface {
  func getWeather(coord: Coord, unit:WeatherUnit, completion: @escaping(Result<WeatherResponse,Error>) -> Void)
  func getCityWeather(city: String, unit:WeatherUnit, completion: @escaping(Result<WeatherResponse,Error>) -> Void)
}

class NetworkManager: NetworkManagerInterface {
    static let shared = NetworkManager()
    private init(){}

  func getWeather(coord: Coord,unit:WeatherUnit, completion: @escaping(Result<WeatherResponse,Error>) -> Void) {
    let lat = String(coord.lat), lon = String(coord.lon)
    WebService.shared.request(route: .getWeather(lat, lon, unit.rawValue), completion: completion)
    }

  func getCityWeather(city: String, unit:WeatherUnit, completion: @escaping(Result<WeatherResponse,Error>) -> Void) {
    WebService.shared.request(route: .getCity(city, unit.rawValue), completion: completion)
    }
}

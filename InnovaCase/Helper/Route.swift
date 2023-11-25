//
//  Route.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

enum Route {
  static let baseUrl = "https://api.openweathermap.org/data/2.5/forecast?"
  case getWeather(String,String,String)
  case getCity(String,String)
    var description: String {
        switch self {
        case .getWeather(let lat, let lon,let unit):
          return "lat=\(lat)&lon=\(lon)&appid=\(Constant.apiKey)&units=\(unit)"
        case .getCity(let city,let unit):
          return "q=\(city)&appid=\(Constant.apiKey)&units=\(unit)"
        }
    }

    var urlString: String {
        switch self {
        default:
            return Route.baseUrl + self.description
        }
    }

  var method:Method {
      switch self {
      case .getWeather(_, _, _):
          return .get
      case .getCity(_, _):
        return .get
      }
  }
}

//
//  WeatherResponse.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

struct WeatherResponse: Codable {
  let cod: String
  let cnt: Int?
  let list: [Weather]?
  let city: City?
}

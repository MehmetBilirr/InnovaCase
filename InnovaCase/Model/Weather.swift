//
//  Weather.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

struct Weather: Codable {
  let dt: Double
  let main: WeatherDetail
  let weather: [WeatherType]
  let wind: Wind
  let visibility: Int
  let pop: Double
  let dt_txt: String

}

struct Wind: Codable {
  let speed: Double
  let deg: Int
  let gust: Double
}

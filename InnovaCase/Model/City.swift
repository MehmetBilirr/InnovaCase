//
//  City.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

struct City: Codable {
  let id: Int
  let name: String
  let coord: Coord
  let country: String
  let population, timezone: Int
  let sunrise, sunset: Double
}

struct Coord: Codable {
  let lat, lon: Double
}

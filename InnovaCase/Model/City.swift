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
    let population, timezone, sunrise, sunset: Int
}

struct Coord: Codable {
    let lat, lon: Double
}

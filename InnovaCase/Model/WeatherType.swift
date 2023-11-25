//
//  WeatherType.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

struct WeatherType: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

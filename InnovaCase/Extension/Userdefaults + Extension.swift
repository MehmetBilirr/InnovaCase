//
//  Userdefaults + Extension.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 26.11.2023.
//

import Foundation
extension UserDefaults {

  func getCacheModels() -> WeatherResponse? {
    if let data = data(forKey: "Weathers") {
      do {
        let cachedModel = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return cachedModel
      } catch {

      }
    }
    return nil
  }

  func saveModeltoCache(_ cacheModel: WeatherResponse) {
    do {
      let data = try JSONEncoder().encode(cacheModel)
      set(data, forKey: "Weathers")
      synchronize()
    } catch let encodeError {
      print("Failed to encode countModel ",encodeError)
    }
  }
}

//
//  Double + Extension.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

extension Double {
    func dateFormatted(format: DateFormat) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date)
     }

  func degreeString() -> String {
    return String(self) + "°"
  }

  func percentSign() -> String {
    return "%" + String(self)
  }
}

enum DateFormat: String {
  case full = "MMM d, h:mm a"
  case hour = "HH:mm"

}

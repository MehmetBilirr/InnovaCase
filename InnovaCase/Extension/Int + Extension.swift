//
//  Int + Extension.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 27.11.2023.
//

import Foundation

extension Int {

  func pressureString() -> String {
    String(self) + " hPa"
  }
  
  func percentSign() -> String {
    return "%" + String(self)
  }
}

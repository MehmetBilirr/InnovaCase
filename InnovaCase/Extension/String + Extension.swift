//
//  String + Extension.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

extension String {
  var asURL:URL? {
    return URL(string: self)
  }
}

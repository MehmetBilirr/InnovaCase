//
//  UIViewController + Extension.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import UIKit

extension UIViewController {

    static var identifier: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)

        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
}

}


enum StoryboardName: String {
  case main = "MainView"
  case detail = "DetailView"
}

//
//  WeatherTableViewCell.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

  @IBOutlet weak var dateLbl: UILabel!
  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var minTempLbl: UILabel!
  @IBOutlet weak var maxTempLbl: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    }

  func configure (weather:Weather) {
    iconImage.image = UIImage(named: weather.weather.first?.icon ?? "")
    dateLbl.text = weather.dt.dateFormatted(format: .full)
    maxTempLbl.text = weather.main.tempMax.degreeString()
    minTempLbl.text = weather.main.tempMin.degreeString()
  }
}

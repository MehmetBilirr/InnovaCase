//
//  DetailViewController.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 26.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var dateLbl: UILabel!
  @IBOutlet weak var seaLvlLbl: UILabel!
  @IBOutlet weak var humidityLbl: UILabel!
  @IBOutlet weak var precipitationLbl: UILabel!
  @IBOutlet weak var pressureLbl: UILabel!
  @IBOutlet weak var windLbl: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var maxLbl: UILabel!
  @IBOutlet weak var minLbl: UILabel!
  @IBOutlet weak var descLbl: UILabel!
  @IBOutlet weak var grndLbl: UILabel!
  var presenter: DetailPresenterInterface?
    override func viewDidLoad() {
        super.viewDidLoad()
      presenter?.viewDidLoad()
    }
}

extension DetailViewController: DetailViewInterface {
  func configureView(weather: Weather) {
    dateLbl.text = weather.dt.dateFormatted(format: .full)
    imageView.image = UIImage(named: weather.weather.first?.icon ?? "")
    seaLvlLbl.text = weather.main.seaLevel.pressureString()
    grndLbl.text = weather.main.grndLevel.pressureString()
    windLbl.text = "\(weather.wind.speed) km/h"
    humidityLbl.text = weather.main.humidity.percentSign()
    precipitationLbl.text = weather.pop.percentSign()
    pressureLbl.text = weather.main.pressure.pressureString()
    descLbl.text = weather.weather.first?.description.capitalized
    minLbl.text = weather.main.tempMin.degreeString()
    maxLbl.text = weather.main.tempMax.degreeString()

  }
}

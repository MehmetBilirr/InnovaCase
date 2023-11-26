//
//  MainViewController.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var cityLbl: UILabel!
  @IBOutlet weak var populationLbl: UILabel!
  @IBOutlet weak var sunLbl: UILabel!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  @IBOutlet weak var countryLbl: UILabel!
  @IBOutlet weak var imageView: UIImageView!

  let searchController = UISearchController()
  let locationManager = CLLocationManager()
  var weatherUnit : WeatherUnit = .celsius
  var presenter: MainPresenterInterface?
  var coord = Coord(lat: 0, lon: 0)

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }

  @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
    switch segmentControl.selectedSegmentIndex {
    case 0 :
      weatherUnit = .celsius
    case 1 :
      weatherUnit = .fahrenheit
    default:
      break;
    }
    presenter?.getUserLocationWeather(location: coord, weatherUnit: weatherUnit)
  }
}


extension MainViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager,
                       didUpdateLocations locations: [CLLocation]) {

    let userLocation: CLLocation = locations[0]
    presenter?.getUserLocationWeather(location: Coord(lat: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude), weatherUnit: weatherUnit)
  }

  func locationManager(_ manager: CLLocationManager,
                       didFailWithError error: Error) {
    showAlert(message: "Konum paylaşmaya izin vermediniz. Şehrinizi aratabilirsiniz.")
    presenter?.getSearchCityWeather(city: "Istanbul", weatherUnit: .celsius)
  }
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.getWeatherCount() ?? 0
  }


  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
    guard let weather = presenter?.getWeather(at: indexPath) else { return UITableViewCell() }
    cell.configure(weather: weather)
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.goToDetail(with: indexPath)
  }
}
extension MainViewController:UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let text = searchBar.text else {return}

    presenter?.getSearchCityWeather(city: text, weatherUnit: weatherUnit)
  }
}

extension MainViewController: MainViewInterface {

  func configureLocationManager() {
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }

  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: WeatherTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.identifier)
  }

  func configureSearchController() {
    navigationItem.searchController = searchController
    searchController.searchBar.delegate = self
  }

  func reloadData() {
    tableView.reloadData()
  }

  func showAlert(message: String) {
    let alert = UIAlertController(title: "Error",
                                  message: message,
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK",
                                  style: .default))
    present(alert, animated: true)

  }

  func configureView(response: WeatherResponse) {
    guard let city = response.city, let image = response.list?.first?.weather.first?.icon  else { return }
    cityLbl.text = city.name
    imageView.image = UIImage(named: image)
    self.coord = city.coord
    countryLbl.text  = "Country: \(city.country)"
    populationLbl.text = "Population: \(city.population)"
    sunLbl.text = "Sunrise: \(city.sunrise.dateFormatted(format: .hour)) - Sunset: \(city.sunset.dateFormatted(format: .hour))";
  }
}

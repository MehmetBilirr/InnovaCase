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
  let searchController = UISearchController()
  let locationManager = CLLocationManager()
  var presenter: MainPresenterInterface?
  override func viewDidLoad() {
        super.viewDidLoad()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    tableView.delegate = self
    tableView.dataSource = self
    navigationItem.searchController = searchController
    searchController.searchBar.delegate = self
  }
}


extension MainViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager,
                       didUpdateLocations locations: [CLLocation]) {

    let userLocation: CLLocation = locations[0]
    print("location: \(userLocation.coordinate.latitude), \(userLocation.coordinate.longitude)")
    NetworkManager.shared.getWeather(coord: Coord(lat: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude), unit: .fahrenheit) { result in
      switch result {
      case .success(let success):
        print(success)
      case .failure(let failure):
        print(failure)
      }
    }
  }

  func locationManager(_ manager: CLLocationManager,
                       didFailWithError error: Error) {
    showAlert(error)
  }

  func showAlert(_ error: Error) {
    let alert = UIAlertController(title: "Error",
                                  message: error.localizedDescription,
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK",
                                  style: .default))
    present(alert, animated: true)
  }
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }


  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  UITableViewCell()
    cell.textLabel?.text = "deneme"
    return cell
  }
}
extension MainViewController:UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let text = searchBar.text else {return}
    print(text)
    NetworkManager.shared.getCityWeather(city: text, unit: .celsius) { result in
      switch result {
      case .success(let success):
        print(success)
      case .failure(let failure):
        print(failure)
      }
    }
  }
}

extension MainViewController: MainViewInterface {
  func reloadData() {
    
  }


}

//
//  WebService.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

final class WebService {

  static let shared = WebService()

  private init() {}

  func request<T:Codable>(route:Route, completion: @escaping(Result<T,Error>) -> Void) {
    guard let request = createRequest(route: route) else { return }
    URLSession.shared.dataTask(with: request) { data, response, error in
      var result: Result<Data,Error>?
      if let data = data {
        result = .success(data)
        let responseString = String(data:data, encoding: .utf8) ?? "Could not stringify our data"
        print("The response is :\n \(responseString)")
      } else if let error = error {
        result = .failure(error)
        print("The error is : \(error.localizedDescription)")
      }
      DispatchQueue.main.async {
        self.handleResponse(result: result, completion: completion)
      }
    }.resume()

  }

  private func handleResponse<T:Codable>(result:Result<Data,Error>?,completion: (Result<T,Error>) -> Void) {
    guard let result = result else {
      completion(.failure(AppError.unknownError))
      return }
    switch result {
    case .success(let data):
      let decoder = JSONDecoder()
      guard let response = try? decoder.decode(T.self, from: data) else {
        completion(.failure(AppError.errorDecoding))
        return
      }
      completion(.success(response))
    case .failure(let error):
      completion(.failure(error))
    }
  }

  private func createRequest (route: Route) -> URLRequest? {
    let urlString = route.urlString
    guard let url = urlString.asURL else { return nil }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = route.method.rawValue
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    return urlRequest
  }
}

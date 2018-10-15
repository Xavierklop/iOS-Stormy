//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Hao Wu on 2018/7/7.
//  Copyright © 2018年 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let darkSkyApiKey = "0089d6d9e02ff085e2d0ceb201c85770"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.darkSkyApiKey)/")!
    }()
    
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias WeatherCompletionHandler = (Weather?, Error?) -> Void
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    
    private func getWeather(at coordinate: Coordinate,completionHandler completion: @escaping WeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, DarkSkyError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, DarkSkyError.requestFailed)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            // the .self(Weather.self) property is used in actual code to retrieve a reference to the type object itself at execution time. That is to say use Weather.self to provide the type itself and not the instance of this type.
                            let weather = try self.decoder.decode(Weather.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, DarkSkyError.invalidData)
                    }
                    
                    
                } else if let error = error {
                    completion(nil, error)
                }
            }
            
        }
        
        task.resume()
    }
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getWeather(at: coordinate) { weather, error in
            // Note: the weather and error you declare is optional, see the CurrentWeatherCompletionHandler.
            completion(weather?.currently, error)
        }
    }
}


























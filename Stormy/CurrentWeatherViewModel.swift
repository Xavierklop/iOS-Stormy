//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Hao Wu on 2018/6/27.
//  Copyright © 2018年 Treehouse. All rights reserved.
//

// ViewModel: the view model's job is to use model data and format it so it can be presented in the view, a bridge object, so to speak, that does nothing but format the data. No communicate with model and view.

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    // There is a question on update the value, because these datas are let? Think about it.
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather) {
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        
        let humidityPercentValue = Int(model.humidity * 100)
        self.humidity = "\(humidityPercentValue)%"
        
        let precipitationPercentValue = Int(model.precipProbability * 100)
        self.precipitationProbability = "\(precipitationPercentValue)%"
        
        self.summary = model.summary
        self.icon = model.iconImage
    }
}





















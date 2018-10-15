//
//  Weather.swift
//  Stormy
//
//  Created by Hao Wu on 2018/7/8.
//  Copyright © 2018年 Treehouse. All rights reserved.
//

// Weather is going to model the current weather as a stored property, again, to match how the JSON data is structed. The struct weahther(or the json in init method) here is the data we get back from request, it include all kind of weather data.
import Foundation

struct Weather: Codable {
    let currently: CurrentWeather
}



























//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Hao Wu on 2018/7/2.
//  Copyright © 2018年 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}
























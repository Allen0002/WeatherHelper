//
//  LocationModel.swift
//  WeatherHelper
//
//  Created by wu ning on 2019/4/18.
//  Copyright © 2019 allen. All rights reserved.
//

import CoreLocation

struct LocationModel {
    var latitude: Double?
    var longitude: Double?
    var city: String?
    var country: String?
    
    init(_ placeMark:CLPlacemark) {
        self.latitude = placeMark.location?.coordinate.latitude
        self.longitude = placeMark.location?.coordinate.longitude
        self.country = placeMark.country
        self.city = placeMark.locality
    }
}

protocol LocationManagerDelegate:NSObjectProtocol {
    func success(_ model:LocationModel)
    func failure(_ error:LocationError)
}

enum LocationError:Error {
    case responseError(description:String)
    case locationError(description:String)
}

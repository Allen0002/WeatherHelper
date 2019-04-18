//
//  WeatherDetailViewController.swift
//  WeatherHelper
//
//  Created by wu ning on 2019/4/18.
//  Copyright © 2019 allen. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    @IBOutlet weak var apparenTemperatureHightLabel: UILabel!
    @IBOutlet weak var apparentTemperatureLowLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var hoonPhoseLabel: UILabel!
    @IBOutlet weak var precipIntensityLabel: UILabel!
    @IBOutlet weak var precipIntensityMaxLabel: UILabel!
    @IBOutlet weak var precipIntensityMaxTimeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var temperatureHightLabel: UILabel!
    @IBOutlet weak var temperatureHightTimeLabel: UILabel!
    @IBOutlet weak var temperatureLowLabel: UILabel!
    @IBOutlet weak var temperatureLowTimeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windBearingLabel: UILabel!
    @IBOutlet weak var windGustLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var dailyModel:DailyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(dailyModel)
    }
    
    func updateUI(_ dailyModel: DailyModel?) {
        if let model = dailyModel {
            apparenTemperatureHightLabel.text = model.apparentTemperatureHigh
            apparentTemperatureLowLabel.text = model.apparentTemperatureLow
            cloudCoverLabel.text = model.cloudCover
            humidityLabel.text = String(model.humidity)
            hoonPhoseLabel.text = model.moonPhase
            precipIntensityLabel.text = model.precipIntensity
            precipIntensityMaxLabel.text = model.precipIntensityMax
            pressureLabel.text = model.pressure
            sunriseTimeLabel.text = model.sunriseDayTime
            sunsetTimeLabel.text = model.sunsetDayTime
            temperatureHightLabel.text = model.temperatureHigh
            temperatureHightTimeLabel.text = model.temperatureHighDayTime
            temperatureLowLabel.text = model.temperatureLow
            temperatureLowTimeLabel.text = model.temperatureLowDayTime
            timeLabel.text = model.dayTime
            visibilityLabel.text = model.visibility
            windBearingLabel.text = model.windBearing
            windGustLabel.text = model.windGust
            windSpeedLabel.text = model.windSpeed
            iconImageView.image = model.weatherIcon
        }
    }
}

import HandyJSON

struct DailyModel:HandyJSON {
    var apparentTemperatureHigh: String = ""
    var apparentTemperatureLow: String = ""
    var cloudCover: String?
    var humidity: Double = 0
    var icon: String = ""
    var moonPhase: String?
    var precipIntensity: String?
    var precipIntensityMax: String?
    var precipIntensityMaxTime: TimeInterval = 0
    var precipType: String?
    var pressure: String?
    var summary: String?
    var sunriseTime: TimeInterval = 0
    var sunsetTime: TimeInterval = 0
    var temperatureHigh: String?
    var temperatureHighTime: TimeInterval = 0
    var temperatureLow: String?
    var temperatureLowTime: TimeInterval = 0
    var time: TimeInterval = 0
    var visibility: String?
    var windBearing: String?
    var windGust: String?
    var windSpeed: String?
}

extension DailyModel{
    var weatherIcon: UIImage? {return UIImage.init(named: self.icon)}
    var weekday: String {return time.weekdayStringFromTimeStamp()}
    var dayTime: String {return time.dateStringFromTimeStamp()}
    var precipIntensityMaxDayTime: String {return precipIntensityMaxTime.dateStringFromTimeStamp()}
    var temperatureHighDayTime: String {return temperatureHighTime.dateStringFromTimeStamp()}
    var temperatureLowDayTime :String {return temperatureLowTime.dateStringFromTimeStamp()}
    var sunsetDayTime:String{return sunsetTime.dateStringFromTimeStamp()}
    var sunriseDayTime:String {return sunriseTime.dateStringFromTimeStamp()}
}



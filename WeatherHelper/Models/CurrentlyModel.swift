import HandyJSON

struct CurrentlyModel: HandyJSON {
    var apparentTemperature: String?
    var cloudCover: Int = 0
    var dewPoint: String?
    var humidity: Double = 0
    var icon: String = ""
    var nearestStormBearing: Int = 0
    var nearestStormDistance: Int = 0
    var ozone: String?
    var precipIntensity: Double = 0
    var precipProbability: Double = 0
    var summary: String?
    var temperature: String?
    var time: TimeInterval = 0
    var windBearing: String?
    var windGust: String?
    var windSpeed: String?
}

extension CurrentlyModel{
    var weatherIcon: UIImage? {return UIImage.init(named: self.icon)}
    var weekday: String {return time.weekdayStringFromTimeStamp()}
}

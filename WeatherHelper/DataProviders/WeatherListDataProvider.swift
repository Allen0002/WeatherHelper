class WeatherListDataProvider{
     //MARK:-- interface API
    
    /// format date for WeatherTableView
    private(set) var dailyList:[DailyModel]?
    
    /// format date for WeatherListHeaderView
    private(set) var currentlyModel: CurrentlyModel?
    
    func requestData(_ latitude:String, longitude:String, success:@escaping ((CurrentlyModel,[DailyModel]) -> Void),failure:@escaping ((Error) -> Void)){
        let url = baseUrl + latitude + "," + longitude
        
        WHServerApi.request(url, success: { [weak self] result in
            guard let currentlyModel = CurrentlyModel.deserialize(from: result, designatedPath: "currently")else {
                failure(NetWorkError.responseError(description: result))
                return
            }
            
            guard let dailyList:[DailyModel] = [DailyModel].deserialize(from: result, designatedPath: "daily.data") as? [DailyModel]else {
                failure(NetWorkError.responseError(description: result))
                return
            }
            self?.currentlyModel = currentlyModel
            self?.dailyList = dailyList
            success(currentlyModel,dailyList)
        }, failure: { error in
            failure(NetWorkError.responseError(description: "\(error)"))
        })
    }
    //MARK:-- private API
    private let baseUrl = "https://api.darksky.net/forecast/f6214911400ab8e00c632efca46630df/"
}

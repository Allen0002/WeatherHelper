import CoreLocation



public class LocationManager:NSObject {
    //MARK:-- interface API
    
    var delegate: LocationManagerDelegate?
    
    public override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
    
    public func startUpdateLocation(){
        if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            let distance : CLLocationDistance = 10.0
            locationManager.distanceFilter = distance
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    public func stopUpdateLocation(){
        locationManager.stopUpdatingLocation()
    }
    
    //MARK:-- private API
    private var locationManager: CLLocationManager
    private var locationStatus: CLAuthorizationStatus = .authorizedWhenInUse
}

extension LocationManager:CLLocationManagerDelegate{
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.delegate = nil
        manager.stopUpdatingLocation()
        guard let location = locations.last else {
            self.delegate?.failure(.responseError(description: "cann't find CLLocation instance"))
            return
        }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard error == nil else {
                self?.delegate?.failure(.responseError(description: String(describing: error)))
                return
            }
            guard let mark = placemarks?[0] else{
                self?.delegate?.failure(.responseError(description: String(describing: "placemarks was not exist")))
                return
            }
            let model = LocationModel.init(mark)
            self?.delegate?.success(model)
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            if locationStatus == .notDetermined {
                self.startUpdateLocation()
            }
        default: print("cann't use the Location")
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.delegate?.failure(.locationError(description: String(describing: error)))
    }
}


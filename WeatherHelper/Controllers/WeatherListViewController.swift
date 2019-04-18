//
//  WeatherListViewController.swift
//  WeatherHelper
//
//  Created by wu ning on 2019/4/18.
//  Copyright © 2019 allen. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {
    @IBOutlet weak var headerContentView: UIView!
    @IBOutlet weak var tableView: WeatherTableView!
    
    lazy var headerView: WeatherListHeaderView = {
        return UIView.initWithXib("WeatherListHeaderView") as! WeatherListHeaderView
    }()
    
    let locationManager = LocationManager.init()
    let dataProvider = WeatherListDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCommonStuff()
        requestData()
    }
    
    @IBAction func clickLocation(_ sender: Any) {
        locationManager.startUpdateLocation()
        locationManager.delegate = self
    }
    
    func requestData(_ latitude:Double = 37.8267, _ longitude:Double = -122.4233) {
        dataProvider.requestData(String(latitude), longitude: String(longitude), success: {[weak self] currentlyModel,dailyModels  in
            self?.headerView.updateUI(currentlyModel)
            self?.tableView.data = dailyModels
            }, failure: { error in
                print("\(error)")
        })
    }
    
    func initCommonStuff() {
        headerContentView.addSubViewFit(self.headerView)
        tableView.initCommonStuff()
        tableView.delegate = self
    }
}

//Mark: --UITableViewDelegate
extension WeatherListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WeatherDetailViewController.init()
        vc.dailyModel = dataProvider.dailyList?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//Mark: --LocationManagerDelegate
extension WeatherListViewController: LocationManagerDelegate{
    func success(_ model: LocationModel) {
        if let latitude = model.latitude, let longitude = model.longitude {
            self.requestData(latitude, longitude)
        }
    }
    func failure(_ error: LocationError) {
        print("LocationError:: \(error)")
    }
}

//
//  WeatherTableView.swift
//  WeatherHelper
//
//  Created by wu ning on 2019/4/18.
//  Copyright © 2019 allen. All rights reserved.
//

import UIKit

class WeatherTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    var data: Array<DailyModel> = [] {
        didSet {
            self.reloadData()
        }
    }
    
    func initCommonStuff() {
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let model = data[indexPath.row]
        cell.imageView?.image = model.weatherIcon
        cell.textLabel?.text = model.weekday + "  H:" + model.apparentTemperatureHigh + "  V:" +  model.apparentTemperatureLow
        return cell
    }
}

//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by SPASOV DIMITROV Vladimir on 07/07/2020.
//  Copyright © 2020 Vla. All rights reserved.
//

import UIKit
import AlamofireImage

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherConditionImageView: UIImageView!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    
    func configureCell(data: List) {
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        let dateString: String = dateFormatter.string(from: data.dtTxt)
        dayLabel.text = dateString
        print(data.dtTxt)
        maxTemperatureLabel.text = "\(data.main.tempMax)"
        minTemperatureLabel.text = "\(data.main.tempMin)"
        if let iconName = data.weather.first?.icon {
            let url = URL(string: "https://openweathermap.org/img/wn/\(iconName)@2x.png")!
            weatherConditionImageView.af_setImage(withURL: url)
        }
        
    }

}

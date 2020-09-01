//
//  ViewController.swift
//  Weather
//
//  Created by SPASOV DIMITROV Vladimir on 06/07/2020.
//  Copyright © 2020 Vla. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    var data: [List] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.makeRequest()
        
        let provider = MoyaProvider<OpenWeatherAPI>(plugins: [NetworkLoggerPlugin()])
        provider.request(.forecast){ [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
                    
                    print("CALL SUCCESS forecast")
                    let weatherList = try response.map([List].self, atKeyPath: "list", using: decoder)
                    print(weatherList.first)
                    self.data = weatherList
                } catch {
                    print("DECODE ERROR forecast")
                }
            case .failure(let error):
                print("CALL ERROR forecast")
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        let weatherData = data[indexPath.row]
        cell.configureCell(data: weatherData)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}


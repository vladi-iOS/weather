//
//  ViewModel.swift
//  Weather
//
//  Created by SPASOV DIMITROV Vladimir on 10/07/2020.
//  Copyright © 2020 Vla. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

class ViewModel {
    var openWeatherAPI = MoyaProvider<OpenWeatherAPI>()
    
    
    func makeRequest() {
        let result = openWeatherAPI
            .rx
            .request(.forecast)
            .map([List].self)
        print(result)
    }
}



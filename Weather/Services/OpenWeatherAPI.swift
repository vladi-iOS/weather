//
//  OpenWeatherAPI.swift
//  Weather
//
//  Created by SPASOV DIMITROV Vladimir on 07/07/2020.
//  Copyright © 2020 Vla. All rights reserved.
//


//api.openweathermap.org/data/2.5/forecast?q=Paris&units=metric&appid=d61cb8237bfecdd662686b8345b65623
import Moya

public enum OpenWeatherAPI {
    static let baseURLString = "https://api.openweathermap.org/data/2.5"
    static let apiKey = "d61cb8237bfecdd662686b8345b65623"
    static let cityString = "Paris"
    static let unitsString = "metric"
    static let languageString = "es"
    
    case cities([Int])
    case forecast
}

extension OpenWeatherAPI: TargetType {

    public var headers: [String: String]? {
        return nil
    }

    public var baseURL: URL {
        assert(!OpenWeatherAPI.apiKey.isEmpty)
        return URL(string: OpenWeatherAPI.baseURLString)!
    }

    public var path: String {
        switch self {
        case .cities:
            return "/group"
        case .forecast:
            return "/forecast"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Task {
        switch self {
        case .cities(let cityIds):
            let params = [
                "appid": OpenWeatherAPI.apiKey,
                "id": cityIds.map {
                    String($0)
                }.joined(separator: ",")
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .forecast:
            let params: [String: Any] = [
                "appid": OpenWeatherAPI.apiKey,
                "q": OpenWeatherAPI.cityString,
                "units": OpenWeatherAPI.unitsString,
                "lang": OpenWeatherAPI.languageString
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }

    public var validate: Bool {
        return false
    }
    
    public var sampleData: Data {
        switch self {
        case .cities:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        case .forecast:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        }
    }
}

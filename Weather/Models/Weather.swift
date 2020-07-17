// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let mainDescription: String
    let datailedDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id
        case mainDescription = "main"
        case datailedDescription = "description"
        case icon
    }
}

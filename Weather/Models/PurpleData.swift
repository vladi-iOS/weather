// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleData = try? newJSONDecoder().decode(PurpleData.self, from: jsonData)

import Foundation

// MARK: - PurpleData
struct PurpleData: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

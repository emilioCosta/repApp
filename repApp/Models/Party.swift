//
//  Party.swift
//  repApp
//
//  Created by Emilio Costa on 04/05/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Party: Hashable, Decodable, Identifiable {
    var id: UUID {
        UUID()
    }
    var name: String
    var cost: Double
    private var dateRaw: String
    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: dateRaw)!
    }
    var location: String
    var description: String
    var additionalInformation: String
    var drinks: [String]
    var owner: String
    var imageName: String
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

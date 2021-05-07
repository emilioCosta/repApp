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
    
    init() {
        name = "Festa Universitária 12"
        cost = 12.00
        dateRaw = "2022-03-12 17:00:00"
        location = "IFCH"
        description = "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus ridiculus integer porta ultrices venenatis aliquet, curabitur et posuere blandit magnis dictum auctor lacinia, eleifend dolor in ornare vulputate ipsum morbi felis. Faucibus cursus malesuada orci ultrices diam nisl taciti torquent, tempor eros suspendisse euismod condimentum dis velit mi tristique, a quis etiam dignissim dictum porttitor lobortis ad fermentum, sapien consectetur dui dolor purus elit pharetra. Interdum mattis sapien ac orci vestibulum vulputate laoreet proin hac, maecenas mollis ridiculus morbi praesent cubilia vitae ligula vel, sem semper volutpat curae mauris justo nisl luctus, non eros primis ultrices nascetur erat varius integer."
        additionalInformation = "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus."
        drinks = [ "Corote", "Breja"]
        owner = "Fulano"
        imageName = "party"
    }
    
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
        print(dateFormatter.date(from: dateRaw)!)
        return dateFormatter.date(from: dateRaw)!
    }
    var dateFormatted: String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        print(dateFormatterGet.date(from: date.description))

        if let dateFormatted = dateFormatterGet.date(from: date.description) {
            return dateFormatterPrint.string(from: dateFormatted)
        } else {
            return "Data não informada"
        }
    }
    var location: String
    var description: String
    var additionalInformation: String
    var drinks: [String]
    var owner: String
    var imageName: String
}

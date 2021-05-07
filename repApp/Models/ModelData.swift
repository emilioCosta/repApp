//
//  ModelData.swift
//  repApp
//
//  Created by Emilio Costa on 04/05/21.
//

import Foundation

var parties: [Party] = load("partiesJSON")

func load<Party: Decodable>(_ filename: String) -> Party {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: ".json")
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(Party.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(Party.self):\n\(error)")
    }
}

//
//  TorreiItem.swift
//  Torrei
//
//  Created by André Porto on 05/07/23.
//

import Foundation

struct TorreiItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

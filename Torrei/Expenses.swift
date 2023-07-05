//
//  Expenses.swift
//  Torrei
//
//  Created by André Porto on 05/07/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [TorreiItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([TorreiItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

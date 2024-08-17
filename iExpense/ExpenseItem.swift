//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Danut Popa on 10.08.2024.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

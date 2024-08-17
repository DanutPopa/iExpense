//
//  ExpenseStyle.swift
//  iExpense
//
//  Created by Danut Popa on 10.08.2024.
//

import SwiftUI

struct ExpenseStyle: ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundStyle(.green)
            
        case 10..<100:
            content
                .foregroundStyle(.blue)
            
        default:
            content
                .font(.headline)
                .foregroundStyle(.red)
        }
    }
}

extension View {
    func expenseStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseStyle(expenseItem: expenseItem))
    }
}

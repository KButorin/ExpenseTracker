//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by ESSIP on 10.08.2024.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $expenses.item.name)
                
                Picker("Type", selection: $expenses.item.type) {
                    ForEach(expenses.item.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $expenses.item.amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .toolbar{
                Button("Save"){
                    expenses.addItem()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}

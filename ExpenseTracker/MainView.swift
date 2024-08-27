//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by ESSIP on 10.08.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items){ item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: expenses.removeItems)
            }
            .navigationTitle("Expense Tracker")
            .toolbar{
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .onAppear(){
                expenses.loadItems()
            }
            .onChange(of: expenses.item) { _ in
                expenses.saveItem()
            }
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView(expenses: expenses)
            }
        }
    }
}

#Preview {
    MainView()
}

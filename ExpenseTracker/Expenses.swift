//
//  Expenses.swift
//  ExpenseTracker
//
//  Created by ESSIP on 10.08.2024.
//

import SwiftUI

protocol ExpandableItems: ObservableObject {
    associatedtype Item: Expendable
    var items: [Item] { get set }
    
    func saveItem()
    func loadItems()
    func addItem()
    func removeItems(atOffsets offsets: IndexSet)
}

class Expenses: ExpandableItems {
    
    @Published var items = [Item]()
    @Published var item: Item
    
    init(){
        item = ExpenseItem(name: "", type: "Personal", amount: 0.0)
    }
    
    typealias Item = ExpenseItem
    
    func addItem() {
        let item = ExpenseItem(name: item.name , type: item.type, amount: item.amount)
        items.insert(item, at: 0)
    }
    
}

extension ExpandableItems {
    func saveItem() {
        if let encoded = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([Item].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    func removeItems(atOffsets offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
}





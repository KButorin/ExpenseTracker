//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by ESSIP on 10.08.2024.
//

import Foundation

protocol Expendable: Identifiable, Codable, Equatable {
    
    var name: String { get }
    var type: String { get }
    var amount: Double { get }
    var types: [String] { get }
}

struct ExpenseItem: Expendable  {
    
    var id = UUID()
    
    var types: [String] = ["Bussiness", "Personal"]

    var name: String
    
    var type: String
    
    var amount: Double
    
    
    
}

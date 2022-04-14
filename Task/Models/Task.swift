//
//  Task.swift
//  Task
//
//  Created by Tasuku Yamamoto on 4/13/22.
//

import Foundation

class Task{
    //MARK: - Properties
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool
    
    //MARK: - Initializer
    init(name: String, notes: String, dueDate: Date){
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = false
    }
    
}

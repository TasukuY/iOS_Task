//
//  TaskController.swift
//  Task
//
//  Created by Tasuku Yamamoto on 4/13/22.
//

import Foundation

class TaskController{
    //MARK: - Properties
    static let shared = TaskController()
    var tasks: [Task] = [] //Sorce of Truth
    
    //MARK: - CRUD funcs
    func createTaskWith(name: String, notes: String?, dueDate: Date?){
        guard let notes = notes, let dueDate = dueDate else { return }
        let newTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(newTask)
        saveDataToPersistenceStore()
    }

    func update(task: Task, newName: String, newNotes: String?, newDueDate: Date?){
        guard let newNotes = newNotes, let newDueDate = newDueDate else { return }
        task.name = newName
        task.notes = newNotes
        task.dueDate = newDueDate
        saveDataToPersistenceStore()
    }

    func toggleIsComplete(task: Task) {
        task.isComplete = !task.isComplete
        saveDataToPersistenceStore()
    }

    func delete(task: Task){
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        saveDataToPersistenceStore()
    }
    
    //MARK: - Persistence
    //Persistence Store/location of the date
    func persistentStore() -> URL {
        //default is a singelton/shared object of filemanager
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Task.json")
        return fileURL
    }
    
    //Save data
    func saveDataToPersistenceStore() {
        do{
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: persistentStore())
        }catch {
            print("We had an error saving to our persistence store")
            print("Encoding Error \(error)")
            print(error.localizedDescription)
        }
    }
    
    //Load data
    func loadDataFromPersistenceStore() {
        do{
            let data = try Data(contentsOf: persistentStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        }catch{
            print("We had an error loading our data from the persistence store")
            print("Decoding Error \(error)")
            print(error.localizedDescription)
        }
    }
    
}//End of class

//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Tasuku Yamamoto on 4/13/22.
//

import UIKit

class TaskDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let task = task {
            //existing task cell tapped
            guard let name = taskNameTextField.text,
                  let notes = taskNotesTextView.text else { return }
            let dueDate = taskDueDatePicker.date
            TaskController.shared.update(task: task, newName: name, newNotes: notes, newDueDate: dueDate)
        }else{
            //add button tapped
            guard let name = taskNameTextField.text,
                  let notes = taskNotesTextView.text else { return }
            let dueDate = taskDueDatePicker.date
            TaskController.shared.createTaskWith(name: name, notes: notes, dueDate: dueDate)
        }
        
        navigationController?.popViewController(animated: true)//to go back to the task lists view
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    //MARK: - Methods
    func updateViews(){
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes ?? ""
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
}

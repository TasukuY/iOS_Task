//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Tasuku Yamamoto on 4/14/22.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    weak var taskCellDelegate: TaskCompletionDelegate?
    var task: Task? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - IBActions
    @IBAction func completionButtonTapped(_ sender: Any) {
        taskCellDelegate?.taskCellButtonTapped(self)
    }
    
    //MARK: - Methods
    func updateViews(){
        print("updateViews called!!")
        guard let task = task else { return }
        taskNameLabel.text = task.name
        if task.isComplete {
            completionButton.setImage(UIImage(named: "complete"), for: .normal)
        }else{
            completionButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}//End of class

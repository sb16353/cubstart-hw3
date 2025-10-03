//
//  ViewModel.swift
//  checklist
//
//  Created by Andy Huang on 7/30/23.
//

import Foundation

@Published var inProgressTasks: [String] = []
@Published var completeTasks: [String] = []

class ViewModel: ObservableObject {
    
    func add(task: String) -> Void {
        inProgressTasks.append(task)
        return
    }
    
    func swapToInProgress(task: String) -> Void {
        if let index = completeTasks.firstIndex(of: task) {
                    completeTasks.remove(at: index)
                    inProgressTasks.append(task)
                }
    }
    
    func swapToComplete(task: String) -> Void {
        if let index = inProgressTasks.firstIndex(of: task) {
                    inProgressTasks.remove(at: index)
                    completeTasks.append(task)
                }
        return
    }
}
    

//
//  MissionViewModel.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation
import SwiftUI
import CoreData

class MissionViewModel: ObservableObject {
    
    private let taskRepository = TaskRepository()
    
    //    @FetchRequest(
    //        sortDescriptors: [
    //            NSSortDescriptor(keyPath: \ToDoTask.dueDate, ascending: true),
    //            NSSortDescriptor(keyPath: \ToDoTask.title, ascending: true)
    //        ],
    //        animation: .default
    //    )
    //    private var tasks: FetchedResults<ToDoTask>
    
    @Published var selection: TaskStatus = TaskStatus.toDo
    
    @Published var tasks: [ToDoTask] = []
    
    
    func getTasks() {
        let result = taskRepository.fetchTasks()
        tasks = result
    }
    
    func addTask(dueDate: Date, title: String, mission: String, recompense: String) {
        taskRepository.addTask(
            dueDate: dueDate,
            title: title,
            mission: mission,
            recompense: recompense
        )
        getTasks()
    }
    
    func deleteTasks(offsets: IndexSet, viewContext: NSManagedObjectContext) {
        taskRepository.deleteTasks(
            tasks: tasks,
            offsets: offsets,
            viewContext: viewContext
        )
        getTasks()
    }
    
    func deleteTask(task: ToDoTask) {
        taskRepository.deleteTask(task: task)
    }
}

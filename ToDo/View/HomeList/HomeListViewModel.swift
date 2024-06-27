//
//  HomeListViewModel.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation
import SwiftUI
import CoreData

class HomeListViewModel: ObservableObject {
	
	private let taskRepository = TaskRepository()
	
	@Published var currentFilter: StatusType = .all
	
	@Published var tasks: [ToDoTask] = []
	
	func getTasks(withStatus status: StatusType?) {
		self.tasks = taskRepository
			.fetchTasks()
			.filter { task in
				if status == .all { return true }
				guard let taskStatus = StatusType(rawValue: task.status ?? "") else { return false }
				return taskStatus == status
			}
	}
	
	func addTask(dueDate: Date, title: String, note: String) {
		taskRepository.addTask(
			dueDate: dueDate,
			title: title,
			note: note
		)
	}
	
	func deleteTasks(offsets: IndexSet, viewContext: NSManagedObjectContext) {
		taskRepository.deleteTasks(
			tasks: tasks,
			offsets: offsets,
			viewContext: viewContext
		)
	}
	
	func deleteTask(task: ToDoTask) {
		taskRepository.deleteTask(task: task)
	}
}

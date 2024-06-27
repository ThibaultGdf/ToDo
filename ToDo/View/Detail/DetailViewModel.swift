//
//  DetailViewModel.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation

class DetailViewModel : ObservableObject {
    
    private let taskRepository = TaskRepository()
	
	@Published var date = Date()
    
	var task: ToDoTask
	
	init(task: ToDoTask) {
		self.task = task
	}
	
    /**
     Permet de modifier la mission et de l'enregistrer
     - Parameters:
        - task : Tâche à modifiée
        - dueDate : Date et heure de la notification
        - title : Titre de la mission
        - note : Description de la mission
        - status : Valeur de l'énumération TaskStatus
     */
    func editTask(
        task: ToDoTask,
        dueDate: Date,
        title: String,
		note: String,
        status: String
    ) {
        taskRepository.editTask(
            task: task,
            dueDate: dueDate,
            title: title,
			note: note,
            status: status
        )
    }
    
    func deleteTask() {
		taskRepository.deleteTask(task: self.task)
    }
}

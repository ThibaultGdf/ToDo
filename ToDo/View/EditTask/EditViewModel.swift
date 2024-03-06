//
//  EditViewModel.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation

class EditViewModel : ObservableObject {
    
    let taskRepository = TaskRepository()
    
    /**
     Permet de modifier la mission et de l'enregistrer
     - Parameters:
        - task : Tâche à modifiée
        - dueDate : Date et heure de la notification
        - title : Titre de la mission
        - mission : Description de la mission
        - recompense : Récompense lorsque la mission  est réalisée
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
}

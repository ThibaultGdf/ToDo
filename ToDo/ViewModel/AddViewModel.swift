//
//  AddViewModel.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation

class AddViewModel : ObservableObject {
    
    private let taskRepository = TaskRepository()
    
    @Published var title: String = ""
    @Published var note: String = ""
    @Published var date = Date()
    
    var isAddButtonDisabled: Bool {
        title.isEmpty || note.isEmpty
    }
    
    /**
     Permet d'ajouter une mission et de l'enregistrer
     */
    func addTask() {
        taskRepository.addTask(
            dueDate: date,
            title: title,
            note: note
        )
    }
}


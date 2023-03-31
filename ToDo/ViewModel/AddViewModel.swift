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
    @Published var mission: String = ""
    @Published var recompense: String = ""
    @Published var date = Date()
    
    var isAddButtonDisabled: Bool {
        title.isEmpty || mission.isEmpty || recompense.isEmpty
    }
    
    /**
     Permet d'ajouter une mission et de l'enregistrer
     */
    func addTask() {
        taskRepository.addTask(
            dueDate: date,
            title: title,
            mission: mission,
            recompense: recompense
        )
    }
}


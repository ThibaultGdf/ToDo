//
//  TaskRepository.swift
//  ToDoUITests
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation
import CoreData

/**
 Source de vérité unique (Single-Source-of-truth) concernant les Tasks
 */
class TaskRepository {
    
    /** Constante utilisée dans saveData() */
    private let container = PersistenceController.shared.container
    
    /**
     Permet de récupérer les tâches stockées dans la base de données
     */
    func fetchTasks() -> [ToDoTask] {
       let request = NSFetchRequest<ToDoTask>(entityName: "ToDoTask")
       do {
          return try container.viewContext.fetch(request)
       } catch {
           // Replace this implementation with code to handle the error appropriately.
           // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
           let nsError = error as NSError
           fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
       }
   }
    
    /**
     Permet d'ajouter une mission et de l'enregistrer
     - Parameters :
        - dueDate : Date et heure de la notification
        - title : Titre de la mission
        - mission : Description de la mission
        - recompense : Récompense lorsque la mission est réalisée
     */
    func addTask(
        dueDate: Date,
        title: String,
		note: String
    ) {
        
        let newTask = ToDoTask(context: self.container.viewContext)
        newTask.id = UUID()
        newTask.dueDate = dueDate
        newTask.title = title
        newTask.note = note
        newTask.status = StatusType.toDo.rawValue
        
        saveData()
        NotificationManager.shared.addNotification(task: newTask)
    }
    
    /**
     Permet de modifier la mission et de l'enregistrer
     - Parameters:
        - task : Tâche à modifiée
        - dueDate : Date et heure de la notification
        - title : Titre de la mission
        - mission : Description de la mission
        - recompense : Récompense lorsque la mission est réalisée
        - status : Valeur de l'énumération TaskStatus
     */
    func editTask(
        task: ToDoTask,
        dueDate: Date,
        title: String,
		note: String,
        status: String
    ) {
        task.dueDate = dueDate
        task.title = title
        task.note = note
        task.status = status
        saveData()
    }
    
    /**
     Permet de supprimer une tâche de la base de données
     - Parameters:
        - task: tâche à supprimer
     */
    func deleteTask(task: ToDoTask) {
        PersistenceController.shared.container.viewContext.delete(task)
    }
    
    
    /**
     Permet de supprimer une tâche de la base de données via le bouton Edit
     - Parameters:
        - offset:
     */
    func deleteTasks(tasks: [ToDoTask], offsets: IndexSet, viewContext: NSManagedObjectContext) {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    /**
     Permet de sauvegarder la mission
     */
    private func saveData() {
        do {
            try container.viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

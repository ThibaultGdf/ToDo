//
//  NotificationManager.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static var shared = NotificationManager()
    let notificationCenter = UNUserNotificationCenter.current()
    
    // Demande d'autorisation de notifications
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error)
            }
        }
    }
    
    func addNotification(task: ToDoTask) {
        guard let id = task.id else {
            return
        }
        
        // Configuration du contenu de la notification
        let content = UNMutableNotificationContent()
        content.title = "Nouvelle tâche à réaliser"
        content.body = "Accedez dès maintenat à votre mission"
        
        // Créez le déclencheur en tant qu'événement répétitif.
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: task.dueDate.components, repeats: false)
        // Créer la demande
        let uuidString = id.uuidString
        let request = UNNotificationRequest(
            identifier: uuidString,
            content: content,
            trigger: trigger
        )
        
        // Planifiez la demande avec le système.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Traiter toutes les erreurs.
            }
        }
    }
}


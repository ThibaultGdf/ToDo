//
//  ToDoApp.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI

@main
struct ToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear { // Affiche la demande d'autorisation des notifications
                    NotificationManager.shared.requestAuthorization()
                }
        }
    }
}

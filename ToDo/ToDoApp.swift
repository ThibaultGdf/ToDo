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
    
    @StateObject var missionVM = MissionViewModel()

    @StateObject var addViewModel = AddViewModel()
    
    @StateObject var editViewModel = EditViewModel()
    
    @StateObject var detailViewModel = DetailViewModel()

    var body: some Scene {
        WindowGroup {
            MissionView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(missionVM)
                .environmentObject(addViewModel)
                .environmentObject(editViewModel)
                .environmentObject(detailViewModel)
                .onAppear { // Affiche la demande d'autorisation des notifications
                    NotificationManager.shared.requestAuthorization()
                }
        }
    }
}

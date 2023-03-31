//
//  EditView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI
import CoreData

struct EditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: EditViewModel
    @ObservedObject var task : ToDoTask
    @State var title: String = ""
    @State var mission: String = ""
    @State var recompense: String = ""
    @State var status: TaskStatus  = .toDo
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Text("Annuler")
                }
                
                Spacer()
                Text("Modifier la mission")
                Spacer()
                Button {
                    viewModel.editTask(
                        task: task,
                        dueDate: task.dueDate,
                        title: title,
                        mission: mission,
                        recompense: recompense,
                        status: status.rawValue
                    )
                    dismiss()
                } label: {
                    Text("Enregistrer")
                }
            } .padding()
            
            Form{
                Section("Modifier la mission") {
                    TextField("", text: $title, prompt: Text("Titre"))
                    TextField("", text: $mission, prompt: Text("Mission"))
                    TextField("", text: $recompense, prompt:   Text("Récompense"))
                }
            }
        }
        .onAppear{
            title = task.title ?? ""
            mission = task.mission ?? ""
            recompense = task.mission ?? ""
        }
    }
    
}

struct EditMissionView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(task: ToDoTask())
            .environmentObject(MissionViewModel())
    }
}


//
//  EditView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI
import CoreData

struct EditTaskView: View {
	
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
	
    @StateObject var viewModel = EditViewModel()
	
    @ObservedObject var task : ToDoTask
	
    @State var title: String = ""
    @State var note: String = ""
    @State var status: StatusType  = .toDo
	
    var body: some View {
        VStack {
            HStack {
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
						note: note,
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
                    TextField("", text: $note, prompt: Text("Mission"))
                }
            }
        }
        .onAppear{
            title = task.title ?? ""
            note = task.note ?? ""
        }
    }
    
}

#Preview {
        EditTaskView(task: ToDoTask())
}


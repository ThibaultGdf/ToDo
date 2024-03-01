//
//  DetailView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = DetailViewModel()
    
    @ObservedObject var newTask: ToDoTask
    
    @State var editTask: ToDoTask?
    @State var isPresented = false
    @State var selection: StatusType = .toDo
    
    private let photo = Image("todo")
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        var startComponents = DateComponents(
            year: 2023,
            month: 1,
            day: 1
        )
        var endComponents = DateComponents(
            year: 2023,
            month: 12,
            day: 31,
            hour: 23,
            minute: 59,
            second: 59
        )
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
            VStack {
                List {
                    Picker("What is the progress?", selection: $selection) {
						ForEach(StatusType.allCases.filter { $0 != .all }, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: selection) { newValue in
                        viewModel.editTask(
                            task: newTask,
                            dueDate: newTask.dueDate,
                            title: newTask.title ?? "",
							note: newTask.note ?? "",
                            status: newValue.rawValue
                        )
                    }
                    
                    Section(header: Text("Mission"))  {
                        Text(newTask.note ?? "")
                    }
                    
                    Section("Alerte programmée :") {
                        DatePicker(
                            "Heure",
                            selection: $newTask.dueDate,
                            in: dateRange,
                            displayedComponents: [.hourAndMinute]
                        )
                        DatePicker(
                            "Date",
                            selection: $newTask.dueDate,
                            in: dateRange,
                            displayedComponents: [.date]
                        ).onChange(of: newTask.dueDate) { newDate in
                            viewModel.editTask(
                                task: newTask,
                                dueDate: newDate,
                                title: newTask.title ?? "",
								note: newTask.note ?? "",
                                status: newTask.status ?? ""
                            )
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text(newTask.title ?? "")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }.padding()
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                EditView(task: newTask)
            }
            
            HStack{
                Button {
                    viewModel.deleteTask(task: newTask)
                    dismiss()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.darkRed)
                            .frame(width: 140, height: 50)
                        
                        Text("Supprimer")
                            .foregroundColor(.white)
                    }
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .frame(width: 140, height: 50)
                    ShareLink(item: newTask.title ?? "") {
                        Text("Partager")
                            .foregroundColor(.white)
                }
            }
        }
        .onAppear(perform: onAppear)
    }
    
    func onAppear () {
        self.selection = StatusType(rawValue:  newTask.status!) ?? .toDo
    }
}

struct DetailView_Previews: PreviewProvider {
    static let persistence = PersistenceController.preview
    static var task: ToDoTask = {
        let context = persistence.container.viewContext
        let task = ToDoTask(context: context)
        task.title = "Titre"
        task.note = "Note"
        task.status = "Status"
        task.dueDate = Date()
        return task
    }()
    
    static var previews: some View {
        DetailView(newTask: task, editTask: task)
    }
}


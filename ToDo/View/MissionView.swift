//
//  MissionView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI
import CoreData

struct MissionView: View {
        
    @State private var showingSheet = false
    
    @EnvironmentObject var viewModel : MissionViewModel
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        NavigationStack{
            VStack{
                Picker("What is the progress?", selection: $viewModel.selection) {
                    ForEach(TaskStatus.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                Form {
                    ForEach(viewModel.tasks.filter { task in
                        task.status == viewModel.selection.rawValue
                    }) { task in
                        NavigationLink {
                            DetailView(newTask: task, editTask: task)
                        } label: {
                            Text(task.title!)
                        }
                    }
                    
                    .onDelete { offsets in
                        viewModel.deleteTasks(offsets: offsets, viewContext: viewContext)
                    }
                    .padding(10)
                    .refreshable {
                        print("Actualisation")
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        EditButton()
                        
                    }
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("ToDo")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingSheet.toggle()
                        } label :{
                            Image(systemName: "plus")
                        }.sheet(isPresented: $showingSheet) {
                            AddMissionView()
                            
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getTasks()
            }
        }
        .onChange(of: showingSheet) { _ in
            viewModel.getTasks()
        }
    }
}

private let taskFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView()
            .environmentObject(MissionViewModel())
    }
}

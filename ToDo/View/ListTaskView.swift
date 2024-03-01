//
//  MissionView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI
import CoreData

// MARK: MissionView
struct ListTaskView: View {
	
	// MARK: Properties
	@State private var showingSheet = false
	@State private var currentFilter: StatusType = .all
	
	@StateObject var viewModel = MissionViewModel()
	
	@Environment(\.managedObjectContext) private var viewContext
	@Environment(\.editMode) private var editMode
	
	// MARK: Body
	var body: some View {
		NavigationStack {
			VStack {
				HStack {
					Text("Filtrer les tâches")
					Spacer()
					Picker("Select a paint color", selection: $currentFilter) {
						ForEach(StatusType.allCases, id: \.self) {
							Text($0.rawValue)
						}
					}
					.onChange(of: self.currentFilter) { newValue in
						viewModel.getTasks(withStatus: newValue)
					}
					.pickerStyle(.menu)
				}.padding()
				
				List {
					ForEach(self.viewModel.tasks) { task in
						NavigationLink {
							DetailView(newTask: task, editTask: task)
						} label: {
							Text(task.title ?? "")
						}
						.padding(10)
						.listRowBackground(StatusType(rawValue: task.status ?? "")?.color ?? Color.purple)
					}
					.onDelete { offsets in
						viewModel.deleteTasks(offsets: offsets, viewContext: viewContext)
					}
					.refreshable {
						print("Actualisation")
					}
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
					} label : {
						Image(systemName: "plus")
					}.sheet(isPresented: $showingSheet) {
						AddMissionView()
					}
				}
			}
			.onAppear {
				viewModel.getTasks(withStatus: currentFilter)
			}
		}
		.onChange(of: showingSheet) { _ in
			viewModel.getTasks(withStatus: currentFilter)
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
		ListTaskView()
			.environmentObject(MissionViewModel())
	}
}

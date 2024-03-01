//
//  ListView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 01/03/2024.
//

import SwiftUI

// MARK: - ListView
struct ListView: View {
	
	// MARK: Properties :
	@ObservedObject var viewModel: MissionViewModel
	
	@Environment(\.managedObjectContext) private var viewContext
	
	// MARK: Body
	var body: some View {
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
		.listRowSpacing(16)
		.scrollContentBackground(.hidden)
	}
}

// MARK: - Preview
#Preview {
	ListView(viewModel: MissionViewModel())
}

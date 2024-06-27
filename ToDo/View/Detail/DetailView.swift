//
//  DetailView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI

// MARK: - DetailView
struct DetailView: View {
	
	// MARK: Properties
	@ObservedObject var viewModel: DetailViewModel
	
	@Environment(\.dismiss) var dismiss

	// MARK: Body
	var body: some View {
		NavigationStack {
			TaskDetailList(viewModel: viewModel)
			Button {
				self.viewModel.deleteTask()
				dismiss()
			} label: {
				Text("Supprimer")
					.foregroundColor(.red)
			}
			.toolbar {
				ToolbarItem(placement: .automatic) {
					ShareLink(item: viewModel.task.title ?? "Ce champ n'est pas rempli") {
								Image(systemName: "square.and.arrow.up")
							}
				}
			}
		}
		
	}
	
	init(task: ToDoTask) {
		self.viewModel = DetailViewModel(task: task)
	}
}

//// MARK: - Preview
#Preview {
	DetailView(task: ToDoTask())
}

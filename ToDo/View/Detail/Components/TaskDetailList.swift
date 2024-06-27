//
//  TaskList.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 04/03/2024.
//

import SwiftUI

// MARK: - TaskList
struct TaskDetailList: View {
	
	// MARK: Properties
	@ObservedObject var viewModel: DetailViewModel
	
	// MARK: Body
    var body: some View {
		Form {
			Section(header: Text("Tâche à faire"))  {
				Text(viewModel.task.title ?? "Ce champ est vide")
			}
			Section(header: Text("Status")) {
				PickerView()
			}
			Section(header: Text("Description"))  {
				Text(viewModel.task.note ?? "Ce champ est vide")
					.frame(
						width: 300,
						height: 100,
						alignment: .topLeading
					)
			}
		}
    }
}

// MARK: - Preview
#Preview {
	TaskDetailList(viewModel: DetailViewModel(task: ToDoTask()))
}

//
//  TaskField.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 04/03/2024.
//

import SwiftUI

// MARK: - TaskField
struct TaskField: View {
	
	// MARK: Properties
	@ObservedObject var viewModel: AddTaskViewModel
	
	// MARK: Body
	var body: some View {
			Section(header: Text("Tâche à faire"))  {
				TextField("Titre de la mission", text: $viewModel.title)
			}
		Section(header: Text("Prévoir une notification"))  {
			DatePicker(
				"Heure",
				selection: $viewModel.date,
				in: Date.now...,
				displayedComponents: [.hourAndMinute]
			)
			DatePicker(
				"Date",
				selection: $viewModel.date,
				in: Date.now...,
				displayedComponents: [.date]
			)
		}
			Section(header: Text("Description"))  {
				TextField("Ajouter une note..", text: $viewModel.note)
					.frame(height: 100, alignment: .top)
			}
	}
}

// MARK: - Preview
#Preview { TaskField(viewModel: AddTaskViewModel()) }

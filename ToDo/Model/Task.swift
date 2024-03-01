//
//  Task.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 01/03/2024.
//

import Foundation

struct Task {
	let id = UUID()
	let title: String
	let note: String
	let status: StatusType
	let dueDate: Date
}

//
//  PickerView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 04/03/2024.
//

import SwiftUI

// MARK: - PickerView
struct PickerView: View {
	
	// MARK: Properties
	@State private var selection: StatusType = .toDo
	
	// MARK: Body
    var body: some View {
		Picker("État de la tâche", selection: $selection) {
			ForEach(StatusType.allCases.filter { $0 != .all }, id: \.self) {
				Text($0.rawValue)
			}
		}
		.pickerStyle(.menu)
    }
}

// MARK: - Preview
#Preview {
    PickerView()
}

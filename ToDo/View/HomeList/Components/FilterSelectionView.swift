//
//  FilterSelectionView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 01/03/2024.
//

import SwiftUI

// MARK: - FilterSelectionView
struct FilterSelectionView: View {
	
	// MARK: Properties
	@ObservedObject var viewModel: HomeListViewModel
	
	// MARK: Body
    var body: some View {
		HStack {
			Text("Filtrer les tâches :")
			Spacer()
			Picker("Select a paint color", selection: $viewModel.currentFilter) {
				ForEach(StatusType.allCases, id: \.self) {
					Text($0.rawValue)
				}
			}
			.onChange(of: self.viewModel.currentFilter) { newValue in
				viewModel.getTasks(withStatus: newValue)
			}
		}.padding(.horizontal)
    }
}

// MARK: - Preview
#Preview {
	FilterSelectionView(viewModel: HomeListViewModel())
}

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
	@StateObject var viewModel = DetailViewModel()
	
	// MARK: Body
	var body: some View {
		TaskDetailList(viewModel: viewModel)
	}
}

// MARK: - Preview
#Preview {
	DetailView()
}

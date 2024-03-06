//
//  HomeListView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI
import CoreData

// MARK: HomeListView
struct HomeListView: View {
	
	// MARK: Properties
	@State private var showingSheet = false
	
	@StateObject var viewModel = HomeListViewModel()
	@State private var isPresented = false
	
	@Environment(\.editMode) private var editMode
	
	// MARK: Body
	var body: some View {
		NavigationStack {
			VStack {
				FilterSelectionView(viewModel: viewModel)
				ListView(viewModel: viewModel)
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
						AddTaskView()
					}
				}
			}
			.onAppear {
				viewModel.getTasks(withStatus: viewModel.currentFilter)
			}
		}
		.onChange(of: showingSheet) { _ in
			viewModel.getTasks(withStatus: viewModel.currentFilter)
		}
	}
}

#Preview {
	HomeListView()
}

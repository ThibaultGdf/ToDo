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
	
	@StateObject var viewModel = MissionViewModel()
	
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
						AddMissionView()
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

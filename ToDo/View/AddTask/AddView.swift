//
//  AddView.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import SwiftUI

struct AddTaskView: View {
    
//    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddTaskViewModel()
    
//    let dateRange: ClosedRange<Date> = {
//        let calendar = Calendar.current
//        var startComponents = DateComponents(year: 2023, month: 1, day: 1)
//        var endComponents = DateComponents(year: 2023, month: 12, day: 31, hour: 23, minute: 59, second: 59)
//        return calendar.date(from:startComponents)!
//        ...
//        calendar.date(from:endComponents)!
//    }()
    
    var body: some View {
		
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Annuler")
                }
                Spacer()
                
                Text("Ajouter une mission")
                
                Spacer()
//                
                Button() {
                    viewModel.addTask()
                    dismiss()
                } label: {
                    Text("Ajouter")
                }
//                .disabled(viewModel.isAddButtonDisabled)
            } .padding()
            
            List {
				TaskField(viewModel: viewModel)
			}
		}
    }
}

#Preview {
        AddTaskView()
}

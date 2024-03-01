//
//  Mission.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation
import SwiftUI

enum StatusType: String, Equatable, CaseIterable {
	
	case all = "All"
    case toDo = "A faire"
    case inProgress = "En cours"
    case finished = "Terminé"
	
	var color: Color {
		switch self {
		case .all: return .clear
		case .toDo: return .red
		case .inProgress: return .orange
		case .finished: return .green
		}
	}
}

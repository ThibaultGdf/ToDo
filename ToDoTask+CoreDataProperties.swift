//
//  ToDoTask+CoreDataProperties.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 03/03/2023.
//
//

import Foundation
import CoreData


extension ToDoTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoTask> {
        return NSFetchRequest<ToDoTask>(entityName: "ToDoTask")
    }

    @NSManaged public var dueDate: Date
    @NSManaged public var id: UUID?
    @NSManaged public var note: String?
    @NSManaged public var status: String?
    @NSManaged public var title: String?

}

extension ToDoTask : Identifiable {

}

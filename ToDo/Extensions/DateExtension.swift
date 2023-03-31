//
//  DateExtension.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation

extension Date {
    func get( components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get( component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    var components: DateComponents {
        var dateComponents = DateComponents()
        
        let date = self.get(components: .day, .month, .year, .hour, .minute, .second)
        
        if let day = date.day,
           let month = date.month,
           let year = date.year,
           let hour = date.hour,
           let minute = date.minute,
           let second = date.second {
            dateComponents.day = day
            dateComponents.month = month
            dateComponents.year = year
            dateComponents.hour = hour
            dateComponents.minute = minute
            dateComponents.second = second
        }
        
        return dateComponents
    }
}

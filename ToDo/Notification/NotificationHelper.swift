//
//  NotificationHelper.swift
//  ToDo
//
//  Created by Thibault GODEFROY on 02/03/2023.
//

import Foundation
import SwiftUI
import UserNotifications

class NotificationHelper {
    static func getTriggerDate(triggerDate: Date) -> DateComponents? {
        return Calendar.current.dateComponents([.timeZone, .year, .month, .day, .hour, .minute, .second], from: triggerDate)
    }
}

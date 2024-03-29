//
//  ScheduleList.swift
//  LiveAttendance
//
//  Created by Lucas Lisboa  on 3/6/24.
//

import Foundation

import Foundation

// Define a struct for schedule items that conforms to Identifiable for easy use in Lists
struct ScheduleItem: Identifiable {
    let id = UUID() // Unique identifier for each schedule item
    let time: String
    let description: String
    let instructor: String
}

// Sample schedule list data
let scheduleList = [
    ScheduleItem(time: "10:00 AM", description: "GI", instructor: "Leo "),
    ScheduleItem(time: "06:30 PM", description: "GI", instructor: "Lucas Lisboa"),
    ScheduleItem(time: "07:30 PM", description: "GI", instructor: "Lucas Lisboa")
]

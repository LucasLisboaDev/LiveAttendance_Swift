//
//  ListView.swift
//  LiveAttendance
//
//  Created by Lucas Lisboa  on 3/3/24.
//

import SwiftUI

struct ListView: View {
    let schedule = scheduleList // Using the structured schedule list

    var body: some View {
        NavigationView {
            List(schedule) { item in
                NavigationLink(destination: AttendClassView(scheduleItem: item)) {
                    HStack {
                        Image("professorLisboa" ).resizable()//systemName:"figure.walk"
                            .resizable() // Make the image resizable
                            .scaledToFit() // Scale the image to fit its bounds while maintaining its aspect ratio
                            .frame(width: 50, height: 50) // Specify the frame size you want
                            .clipShape(Circle()) // Optional: Clip the image to a circle shape
                            .padding(.trailing, 8) // Optional: Add some padding to the right of the image for spacing
                                                
                        VStack(alignment: .leading) {
                            Text(item.time + " - " + item.description)
                                .font(.headline)
                            Text("Instructor: " + item.instructor)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Select your class:")
        }
    }
}


struct AttendClassView: View {
    let scheduleItem: ScheduleItem // Use ScheduleItem instead of String

    var body: some View {
        VStack(spacing: 20) {
            // Adjusted to display the schedule item details
            Text("Ready to mark your attendance for \(scheduleItem.description) with \(scheduleItem.instructor) at \(scheduleItem.time)?")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: {
                // Call attendClass with appropriate parameters
                // Example: You'll need to fetch the actual userID and userName
                attendClass(userID: "YourUserID", userName: "YourUserName", classDetails: "\(scheduleItem.time) - \(scheduleItem.description) with \(scheduleItem.instructor)")
            }) {
                Text("Mark Attendance")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        Spacer()
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}


//
//  LiveAttendanceApp.swift
//  LiveAttendance
//
//  Created by Lucas Lisboa  on 3/1/24.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
// ...
      

@main
struct LiveAttendanceApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

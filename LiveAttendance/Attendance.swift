import FirebaseFirestore

func attendClass(userID: String, userName: String, classDetails: String) {
    let attendanceDate = Date() // Current date and time
    let db = Firestore.firestore() // Firestore database instance

    // Document reference in 'attendance' collection with document ID as userID
    let attendanceRef = db.collection("attendance").document(userID)

    // Data to store
    let attendanceData = [
        "name": userName,
        "classDetails": classDetails,
        "date": Timestamp(date: attendanceDate) // Use Firestore Timestamp to store date
    ] as [String : Any]

    // Set the data for the document
    attendanceRef.setData(attendanceData) { error in
        if let error = error {
            print("Error attending class: \(error.localizedDescription)")
        } else {
            print("Class attendance recorded successfully.")
        }
    }
}

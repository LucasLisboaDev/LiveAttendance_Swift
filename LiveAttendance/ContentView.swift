//
//  ContentView.swift
//  LiveAttendance
//
//  Created by Lucas Lisboa  on 3/1/24.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        if userIsLoggedIn{
            ContentView()
        } else {
            content
        }
    }
    var content: some View {
                    ZStack {
                    Color.blue
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        //.foregroundStyle(.linearGradient(colors: [.red,.pink], startPoint: //.topLeading, endPoint: .bottomTrailing))
                        .frame(width: 1000, height: 400)
                        .rotationEffect(.degrees(125))
                        .offset(y: -350)
                    
                    
                    VStack(spacing: 20 ){
                        Text("Live Attendance")
                            .foregroundColor(.blue)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .offset(x: -100, y: -100)
                            .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 10))
                        
                        TextField("Email", text: $email)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .textFieldStyle(.plain)
                            .placeholder(when: email.isEmpty) {
                                Text("Email")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.white)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: password.isEmpty) {
                                Text("Password")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            
                        
                            Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.white)
                        
                        Button{
                        register()
                        } label: {
                            Text("Sign Up")
                                .bold()
                                .frame(width: 200, height: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.linearGradient(colors: [.green,.purple], startPoint: .top, endPoint: .bottomTrailing))
                                ).foregroundColor(.white)
                        }
                        .padding(.top)
                        .offset(y:100)
                        Button{
                            login()
                        } label: {
                            Text("Already have an account? Login")
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                        .offset(y:100)
                        
                        }
                    .frame(width: 350)
                    .onAppear {
                        Auth.auth().addStateDidChangeListener{auth, user in
                            if user != nil {
                                userIsLoggedIn.toggle()
                        }
                    }
                }
                    
            }
                .ignoresSafeArea()
    }

    func login(){
        Auth.auth().signIn(withEmail: email, password: password ) { result, error in if error != nil {
            print(error!.localizedDescription)
                       }
        }
        
    }

    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in if error != nil {
            print(error!.localizedDescription)
        }
            
        }
    }
    
}

#Preview {
    ContentView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

//
//  Onboarding.swift
//  IOScapstone
//
//  Created by Archer Bergmann on 9/10/24.
//

import SwiftUI

let kFirstName = "firstNameKey"
let kLastName = "lastNameKey"
let kEmail = "emailKey"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var isLoggedIn : Bool = false
    
    
    
    var body: some View {
        
        
        
        NavigationView {
            VStack {
                
                
                NavigationLink( destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                TextField("First Name", text : $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Last Name", text : $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("email", text : $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Register") { action:
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                        print("Registered")
                    } else {
                        print("Please fill in all fields.")
                    }
                       
                
                }
                .onAppear {
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    }
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}

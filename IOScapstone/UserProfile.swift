//
//  UserProfile.swift
//  IOScapstone
//
//  Created by Archer Bergmann on 9/12/24.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName: String
    let lastName: String
    let email: String
    
    init() {
        firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "No First Name"
        lastName = UserDefaults.standard.string(forKey: kLastName) ?? "No Last Name"
        email = UserDefaults.standard.string(forKey: kEmail) ?? "No Email"
    }
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
            Text(firstName)
                .font(.title)
                .padding(.top)
            Text(lastName)
                .font(.title2)
            Text(email)
                .font(.body)
                .padding(.bottom)
            Spacer()
            
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserProfile()
}

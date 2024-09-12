//
//  Menu.swift
//  IOScapstone
//
//  Created by Archer Bergmann on 9/11/24.
//

import SwiftUI

struct Menu: View {
    
    var menuItems: [String] = []
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Your local Meditaranian Bistro!")
        }
    }
}

#Preview {
    Menu()
}

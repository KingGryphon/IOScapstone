//
//  Home.swift
//  IOScapstone
//
//  Created by Archer Bergmann on 9/11/24.
//

import SwiftUI

struct Home: View {
    
    let persistence = PersistenceController()
    
    var body: some View {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}

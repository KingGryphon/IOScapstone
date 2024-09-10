//
//  IOScapstoneApp.swift
//  IOScapstone
//
//  Created by Archer Bergmann on 9/10/24.
//

import SwiftUI

@main
struct IOScapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

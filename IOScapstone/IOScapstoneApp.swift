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
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

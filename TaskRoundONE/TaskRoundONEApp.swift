//
//  TaskRoundONEApp.swift
//  TaskRoundONE
//
//  Created by Sathya on 12/07/25.
//

import SwiftUI

@main
struct TaskRoundONEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

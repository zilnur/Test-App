//
//  Test_AppApp.swift
//  Test App
//
//  Created by Ильнур Закиров on 30.06.2023.
//

import SwiftUI

@main
struct Test_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

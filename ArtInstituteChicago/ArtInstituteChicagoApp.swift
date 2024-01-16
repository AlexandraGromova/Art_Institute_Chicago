import SwiftUI

@main
struct ArtInstituteChicagoApp: App {
//    @StateObject private var persistentContainer = PersistentContainer()

    init() {
        AppContainer.setup()
    }
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                         .environment(\.managedObjectContext, dataController.container.viewContext)
//            MainScreen().environment(\.managedObjectContext, persistentContainer.container.viewContext)
            MainScreen()
//            InfoScreen()
//            StartingScreen()
//            SettingsScreen()
        }
    }
}

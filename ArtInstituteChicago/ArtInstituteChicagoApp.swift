import SwiftUI

@main
struct ArtInstituteChicagoApp: App {
    @StateObject private var dataController = DataController()

    init() {
        AppContainer.setup()
    }
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                         .environment(\.managedObjectContext, dataController.container.viewContext)
            MainScreen().environment(\.managedObjectContext, dataController.container.viewContext)
//            InfoScreen()
//            StartingScreen()
//            SettingsScreen()
        }
    }
}

import SwiftUI

@main
struct ArtInstituteChicagoApp: App {

    init() {
        AppContainer.setup()
    }
    var body: some Scene {
        WindowGroup {
//            MainScreen()
//            InfoScreen()
            StartingScreen()
//            SettingsScreen()
        }
    }
}

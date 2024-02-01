import SwiftUI

@main
struct ArtInstituteChicagoApp: App {

    init() {
        AppContainer.setup()
    }
    var body: some Scene {
        WindowGroup {
               if UserDefaults.standard.object(forKey: "userName") == nil {
                StartingScreen()
            }
        else {
                MainScreen()
            }
        }
    }
}

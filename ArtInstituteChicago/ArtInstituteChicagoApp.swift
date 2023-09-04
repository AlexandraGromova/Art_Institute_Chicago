//
//  ArtInstituteChicagoApp.swift
//  ArtInstituteChicago
//
//  Created by Sasha on 02.08.2023.
//

import SwiftUI

@main
struct ArtInstituteChicagoApp: App {
    init() {
        AppContainer.setup()
    }
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}

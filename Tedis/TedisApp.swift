//
//  TedisApp.swift
//  Tedis
//
//  Created by JoRakuten on 2021/05/01.
//

import SwiftUI

@main
struct TedisApp: App {
    var routerShared = RouterModule.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(routerShared)
        }
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle(showsTitle: false))
    }
}

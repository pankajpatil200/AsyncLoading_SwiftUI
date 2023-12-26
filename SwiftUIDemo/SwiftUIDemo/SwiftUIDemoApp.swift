//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Pankaj Patil on 28/11/2023.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(picsViewModel: PicsViewModel())
        }
    }
}

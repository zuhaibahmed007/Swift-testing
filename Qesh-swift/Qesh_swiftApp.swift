//
//  Qesh_swiftApp.swift
//  Qesh-swift
//
//  Created by Amir Khan on 30/11/2023.
//

import SwiftUI

@main
struct Qesh_swiftApp: App {
    @State private var isLoggedIn = true
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                SecondView()
            } else {
                WellcomeView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

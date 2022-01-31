//
//  IosProjectV1App.swift
//  IosProjectV1
//
//  Created by Deniz on 15.01.2022.
//

import SwiftUI

@main
struct IosProjectV1App: App {
    
    @StateObject private var vm = HomeViewModel(
    )
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
            }
            .environmentObject(vm)
            
        }
    }
}

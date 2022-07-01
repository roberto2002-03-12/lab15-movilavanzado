//
//  LaunchViewModel.swift
//  iOSAppTemplate
//
//  Created by MAC37 on 11/06/22.
//

import SwiftUI
import FirebaseAuth

class LaunchViewModel : ObservableObject {
    
    let appState = AppState.shared

    init() {
        appState.currentScreen = Auth.auth().currentUser != nil ? .main : .signIn
    }
}

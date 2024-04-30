//
//  ContentView.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-29.
//

import SwiftUI
import GoogleSignInSwift

extension AuthenticationViewModel {
    @ObservedObject static var shared = AuthenticationViewModel()
}

struct ContentView: View {
    @StateObject var authenticationViewModel = AuthenticationViewModel.shared
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            switch authenticationViewModel.state {
            case .busy:
                ProgressView()
            case .signedIn:
                NotesListView()
//                ProfileView(authenticationViewModel: authenticationViewModel)
            case .signedOut:
                GoogleSignInButton(action: authenticationViewModel.login)
                    .frame(width: 150, height: 30, alignment: .center)
            }
        }
        .task {
            authenticationViewModel.restorePreviousSignIn()
        }
    }
}

#Preview {
    ContentView()
}

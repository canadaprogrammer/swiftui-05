//
//  ContentView.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-29.
//

import SwiftUI
import GoogleSignInSwift

struct ContentView: View {
    @State var authenticationViewModel = AuthenticationViewModel()
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            switch authenticationViewModel.state {
            case .busy:
                ProgressView()
            case .signedIn:
                ProfileView(authenticationViewModel: authenticationViewModel)
            case .signedOut:
                GoogleSignInButton(action: authenticationViewModel.login)
                    .frame(width: 150, height: 30, alignment: .center)
            }
        }
    }
}

#Preview {
    ContentView()
}
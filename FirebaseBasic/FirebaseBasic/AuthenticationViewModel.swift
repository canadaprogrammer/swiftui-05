//
//  AuthenticationViewModel.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-29.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

extension UIApplication {
    static var currentRootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({ $0 as? UIWindowScene })
        // 값이 존재할 때. nil 이면 drop
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow })
            .first?
            .rootViewController
    }
}
@MainActor
final class AuthenticationViewModel: ObservableObject {
    enum State {
        case busy
        case signedIn
        case signedOut
    }
    
    @Published var state: State = .busy
    private var authResult: AuthDataResult? = nil
    var username: String { authResult?.user.displayName ?? "" }
    var email: String { authResult?.user.email ?? "" }
    var photoURL: URL? { authResult?.user.photoURL }
    
    func logout() {
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.disconnect()
        // try? 에러 발생시 nil 반환. 에러가 발생하지 않으면 반환 타입은 옵셔널.
        // 반환 타입이 없어도 사용 가능하고 do-catch 없이 사용 가능
        try? Auth.auth().signOut()
        authResult = nil
        state = .signedOut
    }
    
    func restorePreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error { print("Error: \(error.localizedDescription)")}
            Task {
                await self.signIn(user: user)
            }
        }
    }
    // Google 에 갔다 오는 것
    func login() {
        state = .busy
        // get clientID from Firebase
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let rootViewController = UIApplication.currentRootViewController else {
            return
        }
        // Google Sign In
        let configuration = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = configuration
        // 화면 앞에 있는 컨트롤러랑 작업을 할 거야
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil) { result, error in
            if let error { print("Error: \(error.localizedDescription)")}
            Task {
                await self.signIn(user: result?.user)
            }
        }
    }
    // Firebase 정보를 가져오는 것
    private func signIn(user: GIDGoogleUser?) async {
        guard let user, let idToken = user.idToken else {
            state = .signedOut
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: user.accessToken.tokenString)
        
        do {
            authResult = try await Auth.auth().signIn(with: credential)
            state = .signedIn
        } catch {
            state = .signedOut
            print("Error: \(error.localizedDescription)")
        }
    }
}

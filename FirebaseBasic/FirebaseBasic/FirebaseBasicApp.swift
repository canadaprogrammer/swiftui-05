//
//  FirebaseBasicApp.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-29.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

// 실행 위임자란 의미로 delegate
class AppDelegate: NSObject, UIApplicationDelegate {
    // option 과 합께 실행을 마친 후에 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    // option 이 url 과 함께 열릴 때 시행
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct FirebaseBasicApp: App {
    // register app delegate for Firebase setup
    // UIKit delegate 함수를 연동시키기 위해
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
//            NotesListView()
        }
    }
}

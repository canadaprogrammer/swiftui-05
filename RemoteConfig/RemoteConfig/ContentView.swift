//
//  ContentView.swift
//  RemoteConfig
//
//  Created by Jungjin Park on 2024-04-29.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfigSwift

class RemoteConfiguration {
    private var remoteConfig = Firebase.RemoteConfig.remoteConfig()
    
    init() {
        // Enable developer mode
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    // to active remote config
    private func activate() {
        remoteConfig.activate { changed, error in
            guard error == nil else {
                print("Error activating Remote Config: \(error!.localizedDescription)")
                return
            }
            print("Default values were \(changed ? "" : "Not ")updated from Remote Config")
        }
    }
    
    // get from remote config server
    func fetchFromServer() async {
        guard let status = try? await remoteConfig.fetch(), status == .success else {
            print("Couldn't fetch Remote Config")
            return
        }
        print("Remote config successfully fetched")
        activate()
    }
    
    // 실시간으로 값이 바뀌는 것을 확인
    func registerForRealtimeUpdates() {
        print("Registering for Remote Config realtime update")
        // 실행된 후에 기다리면서 대기하다가 서버에 configurate update 가 있으면 App 에서도 실행
        remoteConfig.addOnConfigUpdateListener { [self] update, error in
            guard let update, error == nil else { print("Error listening for Remote Config realtime updates: \(error!.localizedDescription)")
                    return
            }
            print("Updated keys in realtime: \(update.updatedKeys)")
            activate()
        }
    }
}
struct ContentView: View {
    private var config = RemoteConfiguration()
    @RemoteConfigProperty(key: "screenType", fallback: nil) var screenType: String?
    
    private var image: (name: String, color: Color) {
        if screenType == "screenA" {
            ("a.square", .green)
        } else if screenType == "screenB" {
            ("b.square", .blue)
        } else {
            ("questionmark.square", .red)
        }
    }
    var body: some View {
        VStack {
            if screenType != nil {
                Image(systemName: image.name)
                    .foregroundStyle(image.color)
                    .font(.system(size: 250))
            } else {
                ProgressView()
                    .controlSize(.large)
            }
        }
        .task {
            await config.fetchFromServer()
            config.registerForRealtimeUpdates()
        }
    }
}

#Preview {
    ContentView()
}

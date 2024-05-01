//
//  Comment.swift
//  FirebaseBasic
//
//  Created by Jungjin Park on 2024-04-30.
//

import Foundation

struct Comment: Codable, Hashable {
    let date: Date
    let body: String
    let author: String?
    let username: String?
    let photoURL: URL?
    var docId: String?
}

//
//  WishlistApp.swift
//  Wishlist
//
//  Created by RE on 03/05/25.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}

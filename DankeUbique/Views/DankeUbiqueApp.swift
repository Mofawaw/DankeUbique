//
//  DankeUbiqueApp.swift
//  DankeUbique
//
//  Created by Kai Zheng on 28.05.22.
//

import SwiftUI

@main
struct DankeUbiqueApp: App {
    @State private var safeAreaInsets: (top: CGFloat, bottom: CGFloat) = (0, 0)
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        safeAreaInsets = (proxy.safeAreaInsets.top, proxy.safeAreaInsets.bottom)
                    }
                }
                
                MainView()
                    .environment(\.safeAreaInsets, safeAreaInsets)
            }
        }
    }
}

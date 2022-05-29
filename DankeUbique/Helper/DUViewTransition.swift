//
//  DUViewTransition.swift
//  DankeUbique
//
//  Created by Kai Zheng on 29.05.22.
//

import SwiftUI

struct DUViewTransition: ViewModifier {
    @State private var appear = false
    let delay: DispatchTimeInterval
    
    func body(content: Content) -> some View {
        content
            .offset(y: appear ? 0 : 20)
            .opacity(appear ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 0.8))
            .onAppear { DispatchQueue.main.asyncAfter(deadline: .now() + delay) { appear = true } }
    }
}

extension View {
    func du_viewTransition(after delay: DispatchTimeInterval = .milliseconds(0)) -> some View {
        return modifier(DUViewTransition(delay: delay))
    }
}

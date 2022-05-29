//
//  DUEnvelopeTransition.swift
//  DankeUbique
//
//  Created by Kai Zheng on 29.05.22.
//

import SwiftUI

struct DUEnvelopeTransition: ViewModifier {
    @State private var appear = false
    let delay: DispatchTimeInterval
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(appear ? 1.0 : 0.3)
            .opacity(appear ? 1.0 : 0.0)
            .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.0))
            .onAppear { DispatchQueue.main.asyncAfter(deadline: .now() + delay) { appear = true } }
    }
}

extension View {
    func du_envelopeTransition(after delay: DispatchTimeInterval = .milliseconds(0)) -> some View {
        return modifier(DUEnvelopeTransition(delay: delay))
    }
}

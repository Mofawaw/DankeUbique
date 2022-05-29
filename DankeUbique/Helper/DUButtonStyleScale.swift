//
//  DUButtonStyleScale.swift
//  DankeUbique
//
//  Created by Kai Zheng on 29.05.22.
//

import SwiftUI

struct DUButtonStyleScale: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
    }
}

extension View {
    func du_buttonStyleScale() -> some View {
        self
            .buttonStyle(DUButtonStyleScale())
            .animation(.easeInOut(duration: 0.15))
    }
}

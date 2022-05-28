//
//  MainView.swift
//  DankeUbique
//
//  Created by Kai Zheng on 28.05.22.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        VStack {
            VStack(spacing: .du_padding_small) {
                Text("Danke für die schöne Zeit")
                    .font(.du_title)
                
                Text("Es war mir eine große Freude, ein Jahr lang, Teil von euch gewesen zu sein. Trotz meiner kurzen Zeit habe ich unglaublich viel gelernt und eine sehr coole Zeit gehabt.\nDie Kultur und Atmosphäre ist wirklich fantastisch. Ich bin gespannt auf den geilen Scheiss, der noch kommt!")
                    .font(.du_text)
                    .multilineTextAlignment(.center)
                    .lineSpacing(Font.du_text_linespacing)
                    .padding(.bottom, .du_padding_small)
                
                Image("me")
            }
            .padding(.top, .du_padding_small)
            
            Spacer()
            
            ZStack {
                Image("envelope")
            }
            .offset(y: -.du_padding_large)
            
            Spacer()
            
            Image("ubique-logo")
        }
        .padding(.horizontal, .du_padding_large)
        .padding(.vertical, .du_padding_small)
    }
}

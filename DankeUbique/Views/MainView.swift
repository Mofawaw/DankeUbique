//
//  MainView.swift
//  DankeUbique
//
//  Created by Kai Zheng on 28.05.22.
//

import SwiftUI
import CodeScanner

struct MainView: View {
    @State private var scannerIsVisible: Bool = false
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: .du_padding_small) {
                    Text("Danke für die schöne Zeit")
                        .font(.du_title)
                    
                    Text("Es war mir eine große Freude, ein Jahr lang Teil von euch gewesen zu sein. Trotz meiner kurzen Zeit habe ich unglaublich viel gelernt und eine sehr coole Zeit gehabt.\nDie Kultur und Atmosphäre ist wirklich fantastisch. Ich bin gespannt auf den geilen Scheiss, der noch kommt!")
                        .font(.du_text)
                        .multilineTextAlignment(.center)
                        .lineSpacing(Font.du_text_linespacing)
                        .padding(.horizontal, .du_padding_large)
                        .padding(.bottom, .du_padding_small)
                    
                    Image("me")
                }
                .padding(.top, .du_padding_small)
                
                Spacer()
                
                ZStack {
                    Image("envelope")
                    
                    Button(action: { scannerIsVisible = true }) {
                        Circle()
                            .frame(width: 72, height: 72)
                            .foregroundColor(Color("scan-button"))
                            .overlay(
                                VStack(spacing: 0) {
                                    Image(systemName: "qrcode.viewfinder")
                                        .font(.system(size: 24, weight: .light))

                                    Text("Scan")
                                        .font(.du_button)
                                }
                            )
                    }
                    .accentColor(.black)
                }
                .offset(y: -.du_padding_large)
                
                Spacer()
                
                Image("ubique-logo")
            }
            .padding(.vertical, .du_padding_small)
        }
        .sheet(isPresented: $scannerIsVisible) {
            CodeScannerView(codeTypes: [.qr]) { result in
                switch result {
                case .success(let result):
                    print(result.string)
                case .failure(let error):
                    print("Scanning failed: \(error.localizedDescription)")
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
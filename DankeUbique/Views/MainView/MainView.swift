//
//  MainView.swift
//  DankeUbique
//
//  Created by Kai Zheng on 28.05.22.
//

import SwiftUI
import CodeScanner

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color.du_background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: .du_padding_small) {
                    Text("Danke für die schöne Zeit")
                        .font(.du_title)
                        .du_viewTransition()
                    
                    Text("Es war mir eine große Freude, ein Jahr lang Teil von euch gewesen zu sein. Trotz meiner kurzen Zeit habe ich unglaublich viel gelernt und eine sehr coole Zeit gehabt.\nDie Kultur und Atmosphäre ist wirklich fantastisch. Ich bin gespannt auf den geilen Scheiss, der noch kommt!")
                        .font(.du_text)
                        .multilineTextAlignment(.center)
                        .lineSpacing(Font.du_text_linespacing)
                        .minimumScaleFactor(0.8)
                        .padding(.horizontal, .du_padding_large)
                        .padding(.bottom, .du_padding_small)
                        .du_viewTransition(after: .milliseconds(200))
                    
                    Image("me")
                        .du_viewTransition(after: .milliseconds(400))
                }
                
                Spacer()
                
                Button(action: { viewModel.envelopeTapped() }) {
                    ZStack {
                        Image("envelope")
                        
                        if viewModel.userDefaultsManager.hasEnvelopeContent {
                            Group {
                                Text(viewModel.envelopeContent.name.first?.description ?? "")
                                    .font(.custom("Quicksand-Bold", size: 32))
                                    .foregroundColor(.du_scan_button)
                                +
                                Text(viewModel.envelopeContent.name.dropFirst())
                                    .font(.custom("Quicksand-Medium", size: 32))
                                    .foregroundColor(.du_background)
                            }
                            .offset(y: -50)
                        } else {
                            Circle()
                                .frame(width: 72, height: 72)
                                .foregroundColor(Color.du_scan_button)
                                .overlay(
                                    VStack(spacing: 0) {
                                        Image(systemName: "qrcode.viewfinder")
                                            .font(.system(size: 24, weight: .light))

                                        Text("Scan")
                                            .font(.du_button)
                                    }
                                )
                        }
                    }
                    .du_envelopeTransition(after: .milliseconds(800))
                }
                .du_buttonStyleScale()
                .offset(y: -.du_padding_large)
                
                Spacer()
                
                Image("ubique-logo")
                    .du_viewTransition(after: .milliseconds(0))
            }
            .padding(.vertical, .du_padding_medium)
        }
        .sheet(isPresented: $viewModel.showingScanner, onDismiss: viewModel.presentScannerResult) {
            CodeScannerView(codeTypes: [.qr]) { viewModel.handleScannerResult($0) }
                .edgesIgnoringSafeArea(.all)
        }
        .alert(isPresented: $viewModel.showingErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.error?.message ?? "Unknown"))
        }
        .fullScreenCover(isPresented: $viewModel.showingEnvelopeContent) {
            EnvelopeContentView(viewModel: viewModel)
        }
    }
}

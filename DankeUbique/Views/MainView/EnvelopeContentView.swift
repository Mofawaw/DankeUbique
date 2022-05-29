//
//  EnvelopeContentView.swift
//  DankeUbique
//
//  Created by Kai Zheng on 29.05.22.
//

import SwiftUI

struct EnvelopeContentView: View {
    @ObservedObject var viewModel = MainViewModel()
    @Environment(\.safeAreaInsets) var safeAreaInsets
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(spacing: .du_padding_small) {
                    Text(viewModel.envelopeContent.title)
                        .font(.du_title)
                        .du_viewTransition()
                    
                    Text(viewModel.envelopeContent.message)
                        .font(.du_text)
                        .multilineTextAlignment(.center)
                        .lineSpacing(Font.du_text_linespacing)
                        .padding(.horizontal, .du_padding_large)
                        .padding(.bottom, .du_padding_medium)
                        .du_viewTransition(after: .milliseconds(200))
                    
                    Image("signature")
                        .du_viewTransition(after: .milliseconds(400))
                }
                
                Spacer(minLength: 2 * .du_padding_large)

                Button(action: { viewModel.showingEnvelopeContent = false }) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150, height: 40)
                        .foregroundColor(Color.du_background)
                        .overlay(
                            ZStack {
                                HStack {
                                    Image(systemName: "arrow.down.square")
                                        .font(.system(size: 24, weight: .light))
                                    Spacer()
                                }

                                Text("Close")
                                    .font(.du_button)
                            }
                            .padding(.du_padding_small)
                        )
                }
                .accentColor(.du_black)
                .du_viewTransition()
            }
            .padding(.vertical, .du_padding_medium)
            .frame(width: UIScreen.main.bounds.size.width)
            .frame(minHeight: UIScreen.main.bounds.size.height - safeAreaInsets.top - safeAreaInsets.bottom)
            .background (
                Image("envelope-content-background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            
        }
    }
}

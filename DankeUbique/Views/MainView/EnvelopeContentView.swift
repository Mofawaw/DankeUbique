//
//  EnvelopeContentView.swift
//  DankeUbique
//
//  Created by Kai Zheng on 29.05.22.
//

import SwiftUI

struct EnvelopeContentView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                Image("envelope-content-background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()

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
                }
                .padding(.vertical, .du_padding_large)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
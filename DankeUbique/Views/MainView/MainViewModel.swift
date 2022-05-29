//
//  MainViewModel.swift
//  DankeUbique
//
//  Created by Kai Zheng on 28.05.22.
//

import SwiftUI
import Combine
import CodeScanner

class MainViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    let userDefaultsManager = UserDefaultsManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    private var networkResult: Result<EnvelopeContent, DUError>?
    var envelopeContent = EnvelopeContent(name: "", title: "", message: "")
    var error: DUError?
    
    @Published var showingScanner: Bool = false
    @Published var showingEnvelopeContent: Bool = false
    @Published var showingErrorAlert: Bool = false
    
    init() {
        if userDefaultsManager.hasEnvelopeContent {
            if let envelopeContent = userDefaultsManager.getEnvelopeContent() {
                self.envelopeContent = envelopeContent
            }
        } else {
            setupNetworkSubsribers()
        }
    }
    
    private func setupNetworkSubsribers() {
        networkManager.didFinishWithResult.sink { result in
            DispatchQueue.main.async {
                self.networkResult = result
                self.showingScanner = false
                print(result)
            }
        }.store(in: &cancellables)
    }
    
    func envelopeTapped() {
        if userDefaultsManager.hasEnvelopeContent {
            showingEnvelopeContent = true
        } else {
            showingScanner = true
        }
    }
    
    func handleScannerResult(_ scannerResult: Result<ScanResult, ScanError>) {
        switch scannerResult {
        case .success(let qrCodeContent):
            networkManager.getEnvelopeContent(with: qrCodeContent.string)
        case .failure(_):
            networkResult = .failure(.qrCode_scanFailed)
            showingScanner = false
        }
    }
    
    func presentScannerResult() {
        switch networkResult {
        case .success(let envelopeContent):
            self.envelopeContent = envelopeContent
            showingEnvelopeContent = true
        case .failure(let error):
            self.error = error
            showingErrorAlert = true
        default: break
        }
        networkResult = nil
    }
}

//
//  NetworkManager.swift
//  DankeUbique
//
//  Created by Kai Zheng on 28.05.22.
//

import SwiftUI
import Combine

class NetworkManager {
    private let baseString = "https://www.kaizheng.de/dankeubique/"
    let didFinishWithResult = PassthroughSubject<Result<EnvelopeContent, DUError>, Never>()
    
    func getEnvelopeContent(with qrCodeResult: String) {
        guard let url = URL(string: baseString + qrCodeResult) else {
            didFinishWithResult.send(.failure(.network_unknown))
            return
        }

        let task = URLSession.shared.downloadTask(with: url) { localURL, response, error in
            guard error == nil else {
                self.didFinishWithResult.send(.failure(.network_unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                self.didFinishWithResult.send(.failure(.network_invalidResponse))
                return
            }
            
            if let localURL = localURL {
                if let urlSource = try? String(contentsOf: localURL) {
                    if let jsonString = WebflowDecoder.extractJSON(urlSource: urlSource) {
                        do {
                            let envelopeContent = try JSONDecoder().decode(EnvelopeContent.self, from: Data(jsonString.utf8))
                            self.didFinishWithResult.send(.success(envelopeContent))
                        } catch {
                            self.didFinishWithResult.send(.failure(.network_unknown))
                            return
                        }
                    }
                }
            } else {
                self.didFinishWithResult.send(.failure(.network_unableToComplete))
                return
            }
        }

        task.resume()
    }
}

//
//  UserDefaultsManager.swift
//  DankeUbique
//
//  Created by Kai Zheng on 29.05.22.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private init() {}
    
    private let envelopeContentKey = "EnvelopeContentKey"
    
    func storeEnvelopeContentJSON(_ jsonString: String) {
        UserDefaults.standard.set(jsonString, forKey: envelopeContentKey)
    }
    
    func getEnvelopeContent() -> EnvelopeContent? {
        if let jsonString = UserDefaults.standard.string(forKey: envelopeContentKey) {
            do {
                let envelopeContent = try JSONDecoder().decode(EnvelopeContent.self, from: Data(jsonString.utf8))
                return envelopeContent
            } catch {
                return nil
            }
        }
        return nil 
    }
    
    var hasEnvelopeContent: Bool { getEnvelopeContent() != nil }
}

//
//  DUError.swift
//  DankeUbique
//
//  Created by Kai Zheng on 28.05.22.
//

import Foundation

enum DUError: String, Error {
    case network_unableToComplete = "Unable to complete your request. Please check your internet connection"
    case network_invalidResponse = "Invalid response from the server. Please try again."
    case network_unknown = "An unknown error occured. You may try restarting the app."
    case qrCode_scanFailed = "Scanning failed. You may try again."
    
    var message: String { return self.rawValue }
}

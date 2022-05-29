//
//  WebflowDecoder.swift
//  DankeUbique
//
//  Created by Kai Zheng on 29.05.22.
//

import Foundation

class WebflowDecoder {
    static func extractJSON(from urlSource: String) -> String? {
        if let rangeStart = urlSource.range(of: "//<JSON>//") {
            if let rangeEnd = urlSource.range(of: "//</JSON>//") {
                return String(urlSource[rangeStart.upperBound..<rangeEnd.lowerBound])
            }
        }
        return nil
    }
}

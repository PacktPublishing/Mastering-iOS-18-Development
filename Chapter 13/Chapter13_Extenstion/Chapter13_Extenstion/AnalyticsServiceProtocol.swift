//
//  AnalyticsServiceProtocol.swift
//  Chapter13_Extenstion
//
//  Created by Avi Tsadok on 25/05/2024.
//

import Foundation


protocol AnalyticsServiceProtocol {
    
    func reportEvent(eventName: String, params: [String: Any])
}

//
//  Logger.swift
//  MyGithub
//
//  Created by kai on 1/17/24.
//

import Foundation
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    /// 네트워킹 관련 로그
    static let networking = Logger(subsystem: subsystem, category: "networking")
}

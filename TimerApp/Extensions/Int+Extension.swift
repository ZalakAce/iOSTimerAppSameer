//
//  Int+Extension.swift
//  TimerApp
//
//  Created by Sameer Personal on 1/6/24.
//

import Foundation

extension Int {
    var asTimestamp: String {
        let millseconds = self % 1000
        let seconds = self / 100
        let minutes = seconds / 60
        return String(format: "%02d:%02d:%03d", minutes, seconds, millseconds)
    }
}

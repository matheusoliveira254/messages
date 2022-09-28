//
//  DateFormatterExtension.swift
//  Messages
//
//  Created by Matheus Oliveira on 9/28/22.
//

import Foundation

extension DateFormatter {
    
    /// Returns a date formatter instance configured with both `timeStyle` and `dateStyle` set to `.short`
    ///
    /// Avoid recalling this function each time you need to format a date.  The date formatter should be stored in whatever class consumes it.
    ///
    /// - Returns: an instance of the configured date formatter
    static func short() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        return formatter
    }
}

//
//  Message.swift
//  Messages
//
//  Created by Matheus Oliveira on 9/28/22.
//

import Foundation
    /// A simple model class representing a message
    class Message: Codable {
        
        let id: UUID
        /// The content of the message
        var text: String
        /// A boolean indicating if the message has been marked as read
        var isRead: Bool
        /// The date the message was created on
        var timeStamp: Date

        /// Initializes a new message with the give text, isRead, and timestamp
        /// - Parameters:
        ///   - text: The content of the message
        ///   - isRead: A boolean indicating if the message has been marked as read
        ///   - timeStamp: The date the message was created on
        init(id: UUID = UUID(), text: String, isRead: Bool = false, timeStamp: Date = Date()) {
            self.id = id
            self.text = text
            self.isRead = isRead
            self.timeStamp = timeStamp
        }
    }

extension Message: Equatable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
}

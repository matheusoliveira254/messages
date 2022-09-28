//
//  MessageTableViewCell.swift
//  Messages
//
//  Created by Matheus Oliveira on 9/28/22.
//

import UIKit

protocol MessageTableViewCellDelegate: AnyObject {
    func markAsReadButtonWasTapped(cell: MessageTableViewCell)
}

class MessageTableViewCell: UITableViewCell {

    /// A label for the contents of the message
    @IBOutlet weak var messageTextLabel: UILabel!
    /// A lable for the date of the message
    @IBOutlet weak var dateTextLabel: UILabel!
    /// A button which can be used to indicate and change if the message is marked as read
    @IBOutlet weak var messageReadButton: UIButton!

    /// A date formatter used to conver the messages date into a coherent string
    var dateFormatter = DateFormatter.short()
    weak var delegate: MessageTableViewCellDelegate?
    
    /// Updates the table view cells views for the given messages content
    /// - Parameter message: The message to display in the cell
    func updateViews(message: Message) {
        
        messageTextLabel.text = message.text
        dateTextLabel.text = dateFormatter.string(from: message.timeStamp)
        let readImageName = message.isRead ? "checkmark.circle" : "circle"
        let readImage = UIImage(systemName: readImageName)
        messageReadButton.setImage(readImage, for: .normal)
    }
    
    @IBAction func messageReadButtonPressed(_ sender: Any) {
        delegate?.markAsReadButtonWasTapped(cell: self)
    }
}

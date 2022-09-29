//
//  MessagesListTableViewController.swift
//  Messages
//
//  Created by Matheus Oliveira on 9/28/22.
//

import UIKit

class MessagesListTableViewController: UITableViewController {
    
    let messageController = MessageController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageController.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageTableViewCell else {return UITableViewCell()}
        let message = messageController.messages[indexPath.row]
        //Step 3 of the Delegation Pattern - will produce an error
        cell.delegate = self
        cell.updateViews(message: message)
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let message = messageController.messages[indexPath.row]
            messageController.deleteMessage(messageToBeDeleted: message)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func presentNewMessageAlertController() {
        let alertController = UIAlertController(title: "New Message", message: "Enter the text for your message below", preferredStyle: .alert)
        alertController.addTextField { messageTextField in
            messageTextField.placeholder = "Type Message"
        }
        let saveAction = UIAlertAction(title: "Save Message", style: .default) { _ in
            guard let messageTextField = alertController.textFields?.first,
            let messageText = messageTextField.text else {return}
            self.messageController.createMessage(text: messageText)
            self.tableView.reloadData()
        }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(dismissAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
    
    @IBAction func addMessageButtonTapped(_ sender: Any) {
        presentNewMessageAlertController()
    }
    
} // End of class

//Step 4 will be the extension that gives the job to the delegate. The Implementation
extension MessagesListTableViewController: MessageTableViewCellDelegate {
    func markAsReadButtonWasTapped(cell: MessageTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let index = messageController.messages[indexPath.row]
        messageController.toggleIsRead(message: index)
        cell.updateViews(message: index)
    }
}

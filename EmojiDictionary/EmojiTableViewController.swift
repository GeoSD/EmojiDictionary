//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Georgy Dyagilev on 09/10/2018.
//  Copyright © 2018 Georgy Dyagilev. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var categorizedEmojis = [CategorizedEmojis]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categorizedEmojis = loadCategorizedEmojis()
        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return categorizedEmojis.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categorizedEmojis[section].category
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorizedEmojis[section].emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiTableViewCell", for: indexPath) as! EmojiTableViewCell
        
        let emoji = categorizedEmojis[indexPath.section].emojis[indexPath.row]
        cell.update(with: emoji)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let movedEmoji = categorizedEmojis[sourceIndexPath.section].emojis.remove(at: sourceIndexPath.row)
            categorizedEmojis[destinationIndexPath.section].emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            
            let indexPath = tableView.indexPathForSelectedRow!
            let section = Int(indexPath.section)
            let row = Int(indexPath.row)
            let emoji = categorizedEmojis[indexPath.section].emojis[indexPath.row]
            let navigationController = segue.destination as! UINavigationController
            
            let addEditEmojiTVC = navigationController.topViewController as! AddEditEmojiTableViewController
            addEditEmojiTVC.navigationItem.title = "Edit emoji."
            addEditEmojiTVC.addFlag = false
            addEditEmojiTVC.choosedEmoji = (section, row, emoji)
        }
    }
    
    @IBAction func unwindToEmojiTableViewController(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "UnwindToEmojiTableViewController" else { return }
        
        let sourceVC = unwindSegue.source as! AddEditEmojiTableViewController
        
        let section = sourceVC.choosedEmoji.0
        let row = sourceVC.choosedEmoji.1
        let emoji = sourceVC.choosedEmoji.2
        
        if sourceVC.addFlag == false {
            categorizedEmojis[section].emojis[row] = emoji
            sourceVC.addFlag = true
        } else {
            categorizedEmojis[section].emojis.append(emoji)
        }
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = categorizedEmojis[indexPath.section].emojis[indexPath.row]
        print(emoji.name + " - \(indexPath)")
    }
}

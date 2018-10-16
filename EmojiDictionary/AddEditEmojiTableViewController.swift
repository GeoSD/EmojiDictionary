//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Georgy Dyagilev on 12/10/2018.
//  Copyright © 2018 Georgy Dyagilev. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    
    var emoji: Emoji = Emoji(symbol: "", name: "", description: "", usage: "")
    
    var choosedEmoji: (Int, Int, Emoji) = (0, 0, Emoji(symbol: "", name: "", description: "", usage: ""))
    var addFlag = true

    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        updateSaveButtonState()
    }
    
    func updateUI() {
        symbolTextField.text = choosedEmoji.2.symbol
        nameTextField.text = choosedEmoji.2.name
        descriptionTextField.text = choosedEmoji.2.description
        usageTextField.text = choosedEmoji.2.usage
    }
    
    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "UnwindToEmojiTableViewController" else { return }
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        choosedEmoji.2 = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }

}

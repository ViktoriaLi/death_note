//
//  AddAPersonViewController.swift
//  Death Note
//
//  Created by Mac Developer on 1/11/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit

class AddAPersonViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionInput.layer.borderWidth = 2
        descriptionInput.layer.borderColor = UIColor.black.cgColor
        nameInput.layer.borderWidth = 0
        let newPosition = nameInput.beginningOfDocument
        nameInput.selectedTextRange = nameInput.textRange(from: newPosition, to: newPosition)
    }

    var note : Note?
    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var descriptionInput: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let currentDate = NSDate()
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        print("test")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyy HH:mm:ss"
        if datePicker.date < currentDate as Date {
            return
        }
        let strDate = dateFormatter.string(from: datePicker.date)
        if nameInput.text != nil {
            print(nameInput!.text!)
        }
        if descriptionInput.text != nil {
            print(descriptionInput.text)
        }
        print(strDate)
        note = Note(name : nameInput!.text!, description : descriptionInput!.text, date : strDate)
    }
}

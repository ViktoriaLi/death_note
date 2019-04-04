//
//  ViewController.swift
//  Death Note
//
//  Created by Mac Developer on 1/11/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleNotes()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier : "newNoteView", sender : self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func unWindSegue(segue : UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindToNoteList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddAPersonViewController,
            let note = sourceViewController.note {
            let newIndexPath = IndexPath(row: notes.count, section: 0)
            notes.append(note)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteTableViewCell
        let note = notes[indexPath.row]
        cell.layer.borderWidth = 10
        cell.titleLabel.text = note.name
        cell.descriptionLabel.text = note.description
        cell.dateLabel.text = note.date
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    private func loadSampleNotes() {
        let Note1 = Note(name : "Homer Simpson", description : "Alcohol.", date : "25 June 2019 12:14:15")
        let Note2 = Note(name : "Marge Simpson", description : "Heart attack.", date : "16 January 2039 09:47:00")
        let Note3 = Note(name : "Bart Simpson", description : "Drugs.", date : "30 November 2015 17:00:54")
        if Note1 != nil && Note2 != nil && Note3 != nil {
            notes.append(Note1!)
            notes.append(Note2!)
            notes.append(Note3!)
        }
    }
    
    
}


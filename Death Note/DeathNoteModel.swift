//
//  DeathNoteModel.swift
//  Death Note
//
//  Created by Mac Developer on 1/11/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit

class Note /*: UIViewController, UITextFieldDelegate*/ {
    
    let name : String
    let description : String
    let date : String
    
    init? (name : String, description : String, date : String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.description = description
        self.date = date
    }
}

var notes = [Note]()

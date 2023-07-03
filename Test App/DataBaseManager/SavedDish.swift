//
//  SavedImage.swift
//  Test App
//
//  Created by Ильнур Закиров on 03.07.2023.
//

import Foundation

extension SavedDish {
    
    var name_: String {
        get {
            return self.name ?? ""
        }
        set {
            self.name = newValue
        }
    }
    
    var imageUrl_: String {
        get {
            return self.imageUrl ?? ""
        }
        set {
            self.imageUrl = newValue
        }
    }
}
